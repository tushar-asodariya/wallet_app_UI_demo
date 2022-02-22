import 'package:flutter/material.dart';

class CardData {
  String? title;
  String? amount;
  String? cardType;
  String? cardNum;
  DateTime? expDate;
  Color? color;

  CardData({this.title,this.color,this.amount,this.cardNum,this.cardType,this.expDate});
}