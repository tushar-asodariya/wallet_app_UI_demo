import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_demo/core/app_export.dart';
import 'package:wallet_demo/presentation/wallets_screen/models/transaction_model.dart';

class TransactionElementWidget extends StatelessWidget {
  TransactionData? transactionData;
  TransactionElementWidget(this.transactionData);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getVerticalSize(
          12.0,
        ),
        bottom: getVerticalSize(
          12.0,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(

                  child:ClipRRect(
            borderRadius: BorderRadius.circular(getSize(16)), // Image border
            child: SizedBox.fromSize(
              size: Size.fromRadius(getSize(20)), // Image radius
              child: Image.asset(transactionData!.image!, fit: BoxFit.cover),
            ),
          ),),
                Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(
                      12,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: getHorizontalSize(
                            2,
                          ),
                        ),
                        child: Text(
                          transactionData!.title!,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.bluegray_800,
                            fontSize: getFontSize(
                              16,
                            ),
                            fontFamily: 'Muli',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getVerticalSize(
                            5,
                          ),
                        ),
                        child: Text(
                          transactionData!.subTitle!,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.bluegray_300,
                            fontSize: getFontSize(
                              14,
                            ),
                            fontFamily: 'Muli',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: Container(


              child: RichText(
                text: TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      text: transactionData!.amount!.split('.')[0],
                      style: TextStyle(
                        color: ColorConstant.gray_900,
                        fontSize: getFontSize(
                          16,
                        ),
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: ('.'+transactionData!.amount!.split('.')[1]+' '+currencySymbol),
                      style: TextStyle(
                        color: ColorConstant.bluegray_100,
                        fontSize: getFontSize(
                          16,
                        ),
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
