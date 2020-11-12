import 'package:barcodeapp/data_models/category_list.dart';
import 'package:barcodeapp/util/constants.dart';
import 'package:barcodeapp/view_models/category_select_view_model.dart';
import 'package:barcodeapp/views/accordion_menu/page/accordinon_menu.dart';
import 'package:barcodeapp/views/category_select/common/category_select_button.dart';
import 'package:barcodeapp/views/common/components/button_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategorySelectScreen extends StatelessWidget {
  const CategorySelectScreen({this.mealType});

  final MealType mealType;

  @override
  Widget build(BuildContext context) {

    return
      SafeArea(
        child: Scaffold(
          //todo 戻るボタンで変更が確定してしまうので、WillPopScope必要
          appBar: AppBar(
            title: const Text('カテゴリー選択'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Consumer<CategorySelectViewModel>(
                builder: (context, model, child) {
              return Column(
                children: [
                  ///カテゴリ選択ボタン
                  ///GridView.builderをExpandedでラップ
                  Expanded(
                    child: GridView.builder(
//          shrinkWrap: true,
                      itemCount: categoryText.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8, //横並びの幅
                        mainAxisSpacing: 10, //縦並びの幅
                        childAspectRatio: 0.85,
                      ),
                      ///カテゴリ選択画面を開いた時に既に選択されているものは連動するようにしたい
                      ///isSelectedをモデル層のデータと連動すると開いた時に既に選択したものは背景変更されて表示
                      itemBuilder:
                          (context, int index) {
                            return
                                 CategorySelectButton(
                                   id: categories[index].id,
                                   icon: categories[index].categoryIcon,
                                   label: categories[index].categoryText,
                                    //todo もはやisEmptyにしないので場合わけ不要
                                   isSelected: (model.breakfastCategory.isEmpty)
                                   ? categories[index].isSelected
                                   : model.breakfastCategory[index].isSelected,

                                   ///categoryTapしたらCategorySelectButtonに渡すisSelectedをcategoriesからの読込値と逆(true)にする
                                   categoryTap: (selectButton, label, id) => categoryTap(
                                       context: context,
                                       mealType: mealType,
                                       isSelected: selectButton,
                                       label: label,
                                       id: id),
                                 );


                   // model層のリスト0の場合：categories[index].isSelected,
//                    朝の場合：model.breakfastCategory[index].isSelected,
//                    昼の場合：model.lunchCategory[index].isSelected,
//                    model.snackCategory[index].isSelected,
//                    model.dinnerCategory[index].isSelected,
//
//
                      },
                    ),
                  ),

                  ///決定ボタン:選択しているものisSelected=trueのものだけリスト化して格納
                  RaisedButton(
                    onPressed: () => selectCategory(context,mealType),
                    color: Colors.orangeAccent,
                    child: Text('選択'),
                  ),
                ],
              );
            })),
      ),
    );

  }

  ///各カテゴリを押してtrueになったらviewModel内でリスト化(同時にmealTypeも入れる)
  Future<void> categoryTap(
      {BuildContext context,
      MealType mealType,
      bool isSelected,
      String label,
      int id}) async {
    final viewModel =
        Provider.of<CategorySelectViewModel>(context, listen: false);
    switch(mealType){
      case MealType.breakfast:
        await viewModel.breakfastCategoryTapped(mealType:mealType,
            isSelected: isSelected, label: label, id: id);
        break;
      case MealType.lunch:
        await viewModel.lunchCategoryTapped(mealType:mealType,
        isSelected:isSelected,label:label,id:id);
        break;
      case MealType.snack:
        await viewModel.snackCategoryTapped(mealType:mealType,
            isSelected:isSelected,label:label,id:id);
        break;
      case MealType.dinner:
        await viewModel.dinnerCategoryTapped(mealType:mealType,
            isSelected:isSelected,label:label,id:id);
        break;
    }
  }

  Future<void> selectCategory(BuildContext context, MealType mealType) async {
    final viewModel =
        Provider.of<CategorySelectViewModel>(context, listen: false);
//    await viewModel.selectCategory();

    ///選択ボタン押したら画面戻りつつ値を渡す
    switch(mealType){
      case MealType.breakfast:
        Navigator.of(context).pop(viewModel.breakfastCategory);
        break;
      case MealType.lunch:
        Navigator.of(context).pop(viewModel.lunchCategory);
        break;
      case MealType.snack:
        Navigator.of(context).pop(viewModel.snackCategory);
        break;
      case MealType.dinner:
        Navigator.of(context).pop(viewModel.dinnerCategory);
        break;
    }



    ///単なるNavigator.pop=>値更新されない
    ///普通のNavigator.pushReplacement=>戻るとbottomNavigationBar消える
  }
}
