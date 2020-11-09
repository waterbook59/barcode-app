import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


List<Category> categories = [
  Category(categoryText: '水・ジュース',
           categoryIcon: Icon(Icons.local_drink),
           isSelected: false, ),
  Category(categoryText: 'ごはん',
    categoryIcon:Icon(IconData(59789)),
    isSelected: false,
  ),
  Category(categoryText: 'パン',
    categoryIcon:const FaIcon(FontAwesomeIcons.breadSlice),
    isSelected: false,
  ),
  Category(categoryText: '汁物・スープ',
    categoryIcon:const Icon(IconData(59607)),
    isSelected: false,
  ),



];



class Category{
  Category({this.categoryText,this.categoryIcon,this.isSelected});
 final String categoryText;
 final Widget categoryIcon;
 final bool isSelected;
}

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

