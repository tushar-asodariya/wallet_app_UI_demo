import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_demo/core/app_export.dart';

import '../models/card_model.dart';




class CardViewWidget extends StatefulWidget {

  @override
  _CardViewWidgetState createState() => _CardViewWidgetState();
}

class _CardViewWidgetState extends State<CardViewWidget> {
  final List<CardData> _items = [
    CardData(title: 'Sales Team',amount: '2,617.14',cardNum: '4483',cardType: 'VIRTUAL',expDate: DateTime(2022,12),color: ColorConstant.blue),
    CardData(title: 'Business Travel',amount: '1,236.14',cardNum: '5236',cardType: 'VIRTUAL',expDate: DateTime(2024,01),color: ColorConstant.black_900),
    CardData(title: 'Home Expenses',amount: '950.14',cardNum: '4512',cardType: 'VIRTUAL',expDate: DateTime(2025,03),color: ColorConstant.blue),

  ];
  final PageController _pageController =
  PageController(viewportFraction: 0.8, initialPage: 0);
  double _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page != null) {
        _page = _pageController.page!;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Wrap(
        children: [
          Container(
            height: getVerticalSize(200),
            child: PageView.builder(
                controller: _pageController,
                itemCount: _items.length ,
                itemBuilder: (context, index) {
                  return CardBuilder(cardList: _items, index: index );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < _items.length ; i++)
                Container(
                  margin: const EdgeInsets.all(2),
                  width: _page==i ? 20: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 1.5),
                      color: _page - i > 1 || _page - i < -1
                          ? Colors.transparent
                          : _page - i > 0
                          ? Colors.grey.withOpacity(1 - (_page - i))
                          : Colors.grey.withOpacity(1 - (i - _page))),
                )
            ],
          )
        ],
      ),
    );
  }
}

class CardBuilder extends StatelessWidget {
  const CardBuilder({
    Key? key,
    required List<CardData> cardList,
    required this.index,
  })  : cardDataList = cardList,
        super(key: key);

  final List<CardData> cardDataList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: getHorizontalSize(8), vertical: getVerticalSize(16)),
      padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20),vertical: getVerticalSize(14)),
        height: getVerticalSize(200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
           Radius.circular(getSize(16)),

        ),
        color: cardDataList[index].color,
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
              color: ColorConstant.bluegray_100.withOpacity(0.5),
              blurRadius: getSize(8),
              spreadRadius: getSize(3),
              offset: Offset(0, -1))
        ],
      ),
      child: Wrap(
        children: [
          Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              direction: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: getHorizontalSize(
                      10,
                    ),
                  ),
                  child: Text(
                    cardDataList[index].title.toString(),

                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color:
                      ColorConstant.indigo_50,
                      fontSize: getFontSize(
                        16,
                      ),
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.w400,
                      height: 1.38,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: getVerticalSize(
                      2,
                    ),
                  ),
                  child: Text(
    (currencySymbol+ cardDataList[index].amount.toString()),
                    overflow:
                    TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color:
                      ColorConstant.gray_100,
                      fontSize: getFontSize(
                        28,
                      ),
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.w700,
                      height: 1.21,
                    ),
                  ),
                ),
              ],

              ),
            Expanded(
              child: Container(),
            ),
            Container(
              width: getHorizontalSize(30),
              height: getVerticalSize(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(getSize(7)),

                ),
                color: cardDataList[index].color!.withGreen(80),
                shape: BoxShape.rectangle,

              ),
              child: Icon(
                Icons.info_outline_rounded,
color: ColorConstant.gray_100,
                size: getSize(20),
              ),
            )
          ],
        ),
          
          Padding(
            padding:  EdgeInsets.only(top:getVerticalSize(18)),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              crossAxisAlignment:
              CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "****",
                 
                  style: TextStyle(
                    color: ColorConstant.gray_100.withOpacity(0.6),
                    fontSize: getFontSize(
                      20,
                    ),
                    fontFamily: 'OCR A Extended',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.60,

                  ),
                ),
                Text(
                  "****",
                 
                  style: TextStyle(
                    color: ColorConstant.gray_100.withOpacity(0.6),
                    fontSize: getFontSize(
                      20,
                    ),
                    fontFamily: 'OCR A Extended',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.60,
                  ),
                ),
                Text(
                  "****",
                 
                  style: TextStyle(
                    color: ColorConstant.gray_100.withOpacity(0.6),
                    fontSize: getFontSize(
                      20,
                    ),
                    fontFamily: 'OCR A Extended',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.60,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: getHorizontalSize(
                      6,
                    ),
                  ),
                  child: Text(
                    cardDataList[index].cardNum.toString(),
                 
                  
                    style: TextStyle(
                      color:
                      ColorConstant.gray_100,
                      fontSize: getFontSize(
                        20,
                      ),
                      fontFamily:
                      'OCR A Extended',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.60,
                      height: 0.65,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:getVerticalSize(14)),
            child:Row(
              children: [
                Wrap(
            direction: Axis.vertical,
                  children: [
                    Text(
                      "CARD TYPE".toUpperCase(),
                      overflow:
                      TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color:
                        ColorConstant.gray_100,
                        fontSize: getFontSize(
                          9,
                        ),
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.90,
                        height: 1.44,
                      ),
                    ),
                    Text(
                      cardDataList[index].cardType.toString(),
                      overflow:
                      TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color:
                        ColorConstant.gray_100,
                        fontSize: getFontSize(
                          17,
                        ),
                        fontFamily:
                        'OCR A Extended',
                        fontWeight: FontWeight.w400,
                        height: 1.29,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child:Container()
                ),
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      "valid thru".toUpperCase(),
                      overflow:
                      TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ColorConstant
                            .gray_100,
                        fontSize: getFontSize(
                          9,
                        ),
                        fontFamily: 'Muli',
                        fontWeight:
                        FontWeight.w600,
                        letterSpacing: 0.90,
                        height: 1.44,
                      ),
                    ),
                    Text(
                      (cardDataList[index].expDate!.month.toString() +'/'+cardDataList[index].expDate!.year.toString().substring(2)),
                      overflow:
                      TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ColorConstant
                            .gray_100,
                        fontSize: getFontSize(
                          17,
                        ),
                        fontFamily:
                        'OCR A Extended',
                        fontWeight:
                        FontWeight.w400,
                        height: 1.29,
                      ),
                    ),
                  ],
                )
              ],
            )
          )
        ],

      )
    );
  }
}

