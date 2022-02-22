import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_demo/core/app_export.dart';
import 'package:wallet_demo/presentation/wallets_screen/widgets/card_view_widget.dart';
import 'package:wallet_demo/presentation/wallets_screen/widgets/transaction_widget.dart';

class WalletsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray_100,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: getVerticalSize(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: getVerticalSize(51), left: getHorizontalSize(16)),
                  child: Text(
                    'Wallets',
                    style: TextStyle(
                      color: ColorConstant.black_900,
                      fontSize: getFontSize(
                        34,
                      ),
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.41,
                      height: 1.21,
                    ),
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(24),
                ),
                CardViewWidget(),
                SizedBox(
                  height: getVerticalSize(40),
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(getSize(36)),
                        topRight: Radius.circular(getSize(36)),
                      ),
                      color: ColorConstant.white_A700,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            color: ColorConstant.bluegray_100.withOpacity(0.5),
                            blurRadius: getSize(8),
                            spreadRadius: getSize(3),
                            offset: Offset(0, -1))
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getHorizontalSize(16)),
                      child: Wrap(
                        children: [
                          Align(
                            heightFactor: getVerticalSize(10),
                            alignment: Alignment.center,
                            child: Container(
                              height: getVerticalSize(
                                4,
                              ),
                              width: getHorizontalSize(
                                47,
                              ),
                              margin: EdgeInsets.only(
                                left: getHorizontalSize(
                                  148,
                                ),
                                right: getHorizontalSize(
                                  148,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstant.bluegray_300_87,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: getVerticalSize(
                                  4,
                                ),
                                bottom: getVerticalSize(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "Transactions",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: ColorConstant.black_900,
                                    fontSize: getFontSize(
                                      20,
                                    ),
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: getVerticalSize(
                                      1,
                                    ),
                                    bottom: getVerticalSize(
                                      1,
                                    ),
                                  ),
                                  child: Container(
                                    height: getSize(
                                      24,
                                    ),
                                    width: getSize(
                                      24,
                                    ),
                                    child: SvgPicture.asset(
                                      ImageConstant.img_iconfilter,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TransactionListView()
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
