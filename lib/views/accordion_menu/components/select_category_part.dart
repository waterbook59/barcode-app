import 'package:barcodeapp/data_models/category_list.dart';
import 'package:barcodeapp/util/constants.dart';
import 'package:barcodeapp/views/accordion_menu/components/category_item.dart';
import 'package:flutter/material.dart';

class SelectCategoryPart extends StatelessWidget {
  const SelectCategoryPart({this.categoryResults});

  final List<Category> categoryResults;

  @override
  Widget build(BuildContext context) {
    //ListView.builderの高さ設定して上げないと下記エラー出るのでSizedBoxでラップ
    // The following assertion was thrown during performResize():
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          ///ListView.builderをColumnでラップ且つshrinkWrap:trueで高さ自動指定
          shrinkWrap: true,
            itemCount: categoryResults.length,
            itemBuilder: (context, int index) {
//            if(categoryResults[index].mealType == MealType.breakfast){
              return CategoryItem(
                selectCategory: categoryResults[index],
                //todo
                onCategoryTapped: null,
              );

//            }else{
//              Container();
//            }



            }),
      ],
    );
  }
}
