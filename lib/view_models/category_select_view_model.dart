import 'package:barcodeapp/data_models/category_list.dart';
import 'package:barcodeapp/models/repository/barcode_repository.dart';
import 'package:barcodeapp/util/constants.dart';
import 'package:flutter/material.dart';

class CategorySelectViewModel extends ChangeNotifier{

  CategorySelectViewModel({BarcodeRepository repository})
      : _barcodeRepository = repository;
  final BarcodeRepository _barcodeRepository;



//  bool _isSelected =false;
//  bool get isSelected => _isSelected;

  ///[選択しているカテゴリーだけを格納] カテゴリボタンタップ時に格納?,選択ボタン時に格納？
  List<Category> categoryResults = <Category>[];


  //
  Future<void> categoryTapped({MealType mealType,bool isSelected,String label,int id}) async{
//    _isSelected =isSelected;
    print('タップする/しないのカテゴリをmodel層へ格納：$isSelected,$label');
    //ここでtrueのものはcategoryResultsとしてisSelectedをtrueに変更登録
    ///条件分岐でisSelected = trueの名前だけListとして格納、falseになったらリストから削除
    //isSelectedがtrue且つidが重複しないものはList<Category>へ追加する
    if(isSelected){
     categoryResults.add(Category(
       mealType: mealType,
       id: id,
       categoryText: label,
       categoryIcon: null,
       isSelected: true,
      ));
    }else{//リスト空のときエラー出るかも
  //elementはリストの中に入ってるCategory一つ一つ、カテゴリー名ではなくid一致するもの削除
      categoryResults.removeWhere((element) => element.id ==id);
    }
    notifyListeners();
  }

  Future<void> selectCategory() async{
    //todo リストゼロならflutterToast表示
    print('カテゴリー選択ボタン：${categoryResults.first.categoryText}');
    //todo 選択したらDBへ登録
    //todo アコーディオンメニューページへ戻る(pushReplacement??)

  }

}