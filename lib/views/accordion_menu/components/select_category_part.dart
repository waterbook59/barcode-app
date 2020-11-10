import 'package:barcodeapp/data_models/category_list.dart';
import 'package:flutter/material.dart';

class SelectCategoryPart extends StatelessWidget {
  const SelectCategoryPart({this.categoryResult});

  final List<Category> categoryResult;

  @override
  Widget build(BuildContext context) {
    //ListView.builderの高さ設定して上げないと下記エラー出るのでSizedBoxでラップ
    // The following assertion was thrown during performResize():
    return SizedBox(
      height: 50,
      child: Card(
        child: ListView.builder(
            itemCount: categoryResult.length,
            itemBuilder: (context, int index) {
              return Text(
                  '選択カテゴリ：${categoryResult[index].mealType},${categoryResult[index].categoryText}');
            }),
      ),
    );
  }
}
