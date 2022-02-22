import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';
import 'package:wallet_demo/core/app_export.dart';
import 'package:wallet_demo/presentation/wallets_screen/models/transaction_model.dart';
import 'package:wallet_demo/presentation/wallets_screen/widgets/transaction_element_widget.dart';

class TransactionListView extends StatelessWidget {

  List<TransactionData> transactionDatalist = [
    TransactionData(
        dataTime: DateTime.now(),
        title: 'Armani',
        subTitle: 'Sales',
        amount: '10.00',
        totalAmt: '+100.00',
        image: ImageConstant.arno),
    TransactionData(
        dataTime: DateTime.now(),
        title: 'Grab Taxi',
        subTitle: 'Sales Team',
        amount: '90.00',
        totalAmt: '+100.00',
        image: ImageConstant.emoji),
    TransactionData(
        dataTime: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day - 1,
            DateTime.now().hour,
            DateTime.now().minute,
            DateTime.now().second),
        title: 'Singapore Airlines',
        subTitle: 'Business Travel',
        amount: '250.00',
        totalAmt: '750.00',
        image: ImageConstant.arno),
    TransactionData(
        dataTime: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day - 1,
            DateTime.now().hour,
            DateTime.now().minute,
            DateTime.now().second),
        title: 'Armani2',
        subTitle: 'Sales2',
        amount: '500.00',
        totalAmt: '750.00',
        image: ImageConstant.bmw),
    TransactionData(
        dataTime: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day - 2,
            DateTime.now().hour,
            DateTime.now().minute,
            DateTime.now().second),
        title: 'Volkswagen',
        subTitle: 'Cars',
        amount: '500.00',
        totalAmt: '1000.50',
        image: ImageConstant.volkswagen),
    TransactionData(
        dataTime: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day - 2,
            DateTime.now().hour,
            DateTime.now().minute,
            DateTime.now().second),
        title: 'Surf Coffee',
        subTitle: 'Beverages',
        amount: '500.50',
        totalAmt: '1000.50',
        image: ImageConstant.surf_coffee),
    TransactionData(
        dataTime: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day - 3,
            DateTime.now().hour,
            DateTime.now().minute,
            DateTime.now().second),
        title: 'McDonalds',
        subTitle: 'Fast Food',
        amount: '320.00',
        totalAmt: '4200.00',
        image: ImageConstant.mcd),
    TransactionData(
        dataTime: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day - 3,
            DateTime.now().hour,
            DateTime.now().minute,
            DateTime.now().second),
        title: 'Mercedes',
        subTitle: 'Car',
        amount: '1100.00',
        totalAmt: '4200.00',
        image: ImageConstant.mercedes),
  ];

  @override
  Widget build(BuildContext context) {
    return  StickyGroupedListView<TransactionData, DateTime>(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      elements: transactionDatalist,
      order: StickyGroupedListOrder.ASC,
      groupBy: (TransactionData element) => DateTime(
          element.dataTime!.year,
          element.dataTime!.month,
          element.dataTime!.day),
      groupComparator: (DateTime value1, DateTime value2) =>
          value2.compareTo(value1),
      itemComparator: (TransactionData element1,
          TransactionData element2) =>
          element1.dataTime!.compareTo(element2.dataTime!),
      floatingHeader: true,
      groupSeparatorBuilder: (TransactionData element) =>
          Padding(
            padding:  EdgeInsets.only(top: getVerticalSize(12),bottom: getVerticalSize(12)),
            child: Row(
              children: [
                Text((DateTime(
                  element.dataTime!.year,
                  element.dataTime!.month,
                  element.dataTime!.day) == DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day) ? 'Today' : DateFormat('d, MMMM').format(element.dataTime!)),
                  style: TextStyle(
                    color: ColorConstant.bluegray_400,
                    fontSize: getFontSize(
                      16,
                    ),
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.w700,
                  ),),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        TextSpan(
                          text: element.totalAmt!.split('.')[0],
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
                          text: ('.'+element.totalAmt!.split('.')[1]+' '+currencySymbol),
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
              ],
            ),
          ),
      itemBuilder: (_, TransactionData element) {
        return TransactionElementWidget(element);
      },
    );
  }
}
