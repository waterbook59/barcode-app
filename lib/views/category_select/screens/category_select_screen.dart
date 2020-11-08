import 'package:barcodeapp/data_models/category_list.dart';
import 'package:barcodeapp/view_models/category_select_view_model.dart';
import 'package:barcodeapp/views/category_select/common/category_select_button.dart';
import 'package:barcodeapp/views/common/components/button_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategorySelectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('カテゴリー選択'),),
        body:
        Padding(
          padding: const EdgeInsets.all(15),
          child:Consumer<CategorySelectViewModel>
            (builder: (context, model, child) {
            return Column(
            children: [
              ///カテゴリ選択ボタン
              ///GridView.builderをExpandedでラップ
              Expanded(
                child: GridView.builder(
//          shrinkWrap: true,
                itemCount: categoryText.length,
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,//横並びの幅
                      mainAxisSpacing: 10,//縦並びの幅
                      childAspectRatio: 0.85,
                    ) ,
                    itemBuilder:(context,int index)=>
                      CategorySelectButton(
                        icon:categoryIcon[index],
                        label: categoryText[index],
                        categoryTap:(label)=>categoryTap(context: context,isSelected: model.isSelected),
                        isSelected: model.isSelected,
                  ),
                ),
              ),
              ///決定ボタン:選択しているものisxxx=trueのものだけリスト化して格納
              RaisedButton(
                  onPressed: null,
              color: Colors.orangeAccent,
              child: Text('選択'),),
            ],
          );




    })

        ),
      ),
    );
  }

  Future<void> categoryTap({BuildContext context,bool isSelected}) async{
    print('onTap!!!:');
    final viewModel = Provider.of<CategorySelectViewModel>(context, listen: false);
    await viewModel.categoryTapped(isSelected: isSelected);
  }
}


