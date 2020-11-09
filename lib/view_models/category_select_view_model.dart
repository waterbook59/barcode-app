import 'package:barcodeapp/data_models/category_list.dart';
import 'package:barcodeapp/models/repository/barcode_repository.dart';
import 'package:flutter/material.dart';

class CategorySelectViewModel extends ChangeNotifier{

  CategorySelectViewModel({BarcodeRepository repository})
      : _barcodeRepository = repository;
  final BarcodeRepository _barcodeRepository;



  bool _isSelected =false;
  bool get isSelected => _isSelected;

  ///[選択しているカテゴリーだけを格納] カテゴリボタンタップ時に格納?,選択ボタン時に格納？
  List<Category> categoryResults = <Category>[];


  //
  Future<void> categoryTapped({bool isSelected,String label}) async{
    _isSelected =isSelected;
    print('タップする/しないの値をmodel層へ格納：$_isSelected,$label');
    //ここでtrueのものはcategoryResultsとしてisSelectedをtrueに変更登録
    ///条件分岐でisSelected = trueの名前だけListとして格納、falseになったらリストから削除
    //isSelectedがtrue且つ名前が一緒ではないものはList<Category>へ追加する
    if(isSelected){
     categoryResults.add(Category(
        categoryText: label,
        categoryIcon: null,
        isSelected: true,
      ));
    }else{//リスト空のときエラー出るかも
      //elementはリストの中に入ってるCategory一つ一つ
      categoryResults.removeWhere((element) => element.categoryText ==label);
    }
    notifyListeners();
  }

  Future<void> selectCategory() async{
    print('カテゴリー選択ボタン：${categoryResults.first.categoryText}');

  }

}