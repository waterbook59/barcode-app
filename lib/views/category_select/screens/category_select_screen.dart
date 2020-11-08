import 'package:barcodeapp/data_models/category_list.dart';
import 'package:barcodeapp/views/category_select/common/category_select_button.dart';
import 'package:barcodeapp/views/common/components/button_with_icon.dart';
import 'package:flutter/material.dart';

class CategorySelectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('カテゴリー選択'),),
        body:
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
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
                        categoryTap:(label)=>categoryTap(context,label),
                  ),
                ),
              ),
              ///決定ボタン
              RaisedButton(
                  onPressed: null,
              color: Colors.orangeAccent,
              child: Text('選択'),),
            ],
          ),
        ),




      ),
    );
  }

  void categoryTap(BuildContext context,String label) {
    print('onTap!!!:$label');
  }
}


