import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:wallet_demo/presentation/more_screen/more_screen.dart';
import 'package:wallet_demo/presentation/request_screen/request_screen.dart';
import 'package:wallet_demo/presentation/teams_screen/teams_screen.dart';
import 'package:wallet_demo/presentation/wallets_screen/wallets_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/utils/image_constant.dart';
import 'core/utils/math_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
     MyApp(), // Wrap your app
      );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet',
      home: MainScreen(menuScreenContext: context,),
    );
  }
}

class MainScreen extends StatefulWidget {
  final BuildContext? menuScreenContext;
  MainScreen({Key? key, this.menuScreenContext}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PersistentTabController? _controller;
  bool? _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }
  List<Widget> _buildScreens() {
    return [
      WalletsScreen(),
      TeamsScreen(),
      RequestScreen(),
      MoreScreen()
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(
          ImageConstant.wallet_icon,
          color: CupertinoColors.activeBlue,


          fit: BoxFit.fill,
        ),
        inactiveIcon: Image.asset(
          ImageConstant.wallet_icon,


          fit: BoxFit.fill,
        ),
        title: ("Wallets"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon:  Image.asset(
          ImageConstant.team_icon,
          color: CupertinoColors.activeBlue,

          fit: BoxFit.fill,
        ),
        inactiveIcon:  Image.asset(
          ImageConstant.team_icon,

          fit: BoxFit.fill,
        ),
        title: ("Teams"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon:  Image.asset(
          ImageConstant.request_icon,
          color: CupertinoColors.activeBlue,

          fit: BoxFit.fill,
        ),
        inactiveIcon:  Image.asset(
          ImageConstant.request_icon,

          fit: BoxFit.fill,
        ),
        title: ("Requests"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon:  Image.asset(
          ImageConstant.more_icon,
          color: CupertinoColors.activeBlue,
          fit: BoxFit.fill,
        ),
        inactiveIcon:  Image.asset(
          ImageConstant.more_icon,

          fit: BoxFit.fill,
        ),
        title: ("More"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: PersistentTabView.custom(
        context,
        controller: _controller,
        screens: _buildScreens(),
        confineInSafeArea: true,
        itemCount: 4,
        handleAndroidBackButtonPress: true,
        stateManagement: true,
        hideNavigationBar: _hideNavBar,
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        customWidget: CustomNavBarWidget(
          items: _navBarsItems(),
          onItemSelected: (index) {
            setState(() {
              _controller!.index = index; // THIS IS CRITICAL!! Don't miss it!
            });
          },
          selectedIndex: _controller!.index,
        ),
      ),
    );
  }
}
class CustomNavBarWidget extends StatelessWidget {
  final int? selectedIndex;
  final List<PersistentBottomNavBarItem>? items; // NOTE: You CAN declare your own model here instead of `PersistentBottomNavBarItem`.
  final ValueChanged<int>? onItemSelected;

  CustomNavBarWidget(
      {Key? key,
        this.selectedIndex,
        @required this.items,
        this.onItemSelected,});

  Widget _buildItem(
      PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      height: getVerticalSize(60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: getSize(26),
                  color: isSelected
                      ? (item.activeColorSecondary == null
                      ? item.activeColorPrimary
                      : item.activeColorSecondary)
                      : item.inactiveColorPrimary == null
                      ? item.activeColorPrimary
                      : item.inactiveColorPrimary),
              child: isSelected?  item.icon : item.inactiveIcon!,
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: getSize(5)),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                  child: Text(
                    item.title.toString(),
                    style: TextStyle(
                        color: isSelected
                            ? (item.activeColorSecondary == null
                            ? item.activeColorPrimary
                            : item.activeColorSecondary)
                            : item.inactiveColorPrimary,
                        fontWeight: FontWeight.w400,
                        fontSize: getFontSize(12)),
                  )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        width: double.infinity,
        height: getVerticalSize(60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items!.map((item) {
            int index = items!.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  this.onItemSelected!(index);
                },
                child: _buildItem(
                    item, selectedIndex == index),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}