import 'package:barcodeapp/data_models/category_list.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {

  const CategoryItem({this.selectCategory,this.onCategoryTapped});
  final Category selectCategory;
  final ValueChanged onCategoryTapped;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.transparent,
      child: ListTile(
        title: Text("${selectCategory.categoryText}", style: TextStyle(color: Colors.black87,fontSize: 14),),
        leading: selectCategory.categoryIcon,

//            _deleteWord(_wordList[position]),
        onTap: () => onCategoryTapped(selectCategory),
      ),
      );
  }
}
