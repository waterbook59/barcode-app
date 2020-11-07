import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//テキスト
List<String> categoryText = [
  '水・ジュース',
  'ごはん',
  'パン',
  '汁物・スープ',
//  'おかず',
//  '缶詰',
//  '果物',
//  'おやつ',
//  'その他',

];
//上のテキストに対応したアイコン
List<Widget> categoryIcon = [
  Icon(Icons.local_drink),
  Icon(IconData(59789)),//rice_bowl
  FaIcon(FontAwesomeIcons.breadSlice) ,
  Icon(IconData(59607)),//outdoor_grill)


];

