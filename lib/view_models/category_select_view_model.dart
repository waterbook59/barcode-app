import 'package:barcodeapp/data_models/category_list.dart';
import 'package:barcodeapp/models/repository/barcode_repository.dart';
import 'package:barcodeapp/util/constants.dart';
import 'package:flutter/material.dart';

class CategorySelectViewModel extends ChangeNotifier {
  CategorySelectViewModel({BarcodeRepository repository})
      : _barcodeRepository = repository;
  final BarcodeRepository _barcodeRepository;

//  bool _isSelected =false;
//  bool get isSelected => _isSelected;

  ///[選択しているカテゴリーだけを格納] カテゴリボタンタップ時に格納し,選択ボタン時に格納外し
  List<Category> breakfastCategory = <Category>[];
  List<Category> lunchCategory = <Category>[];
  List<Category> snackCategory = <Category>[];
  List<Category> dinnerCategory = <Category>[];

  //
  Future<void> breakfastCategoryTapped(
      {MealType mealType, bool isSelected, String label, int id}) async {

    print('タップする/しないのカテゴリをmodel層へ格納：$isSelected,$label');
    ///ベースはcategoriesとしてその一部を変更していくイメージ、リストの一部を切り出すと呼び出した時数が合わずにエラー
    ///trueだけを格納すると取り出す時変になるからselectCategoryメソッドの方で、
    ///true/falseまとめてリストへ可能する方が良い
    //条件分岐でisSelected = trueの名前だけListとして格納、falseになったらリストから削除

    //todo 順番が変更されてしまい重複登録が起こりエラー
    ///まずbreakfastCategoryはcategoriesとしてインスタンス登録
    breakfastCategory = categories;
    ///isSelectedがtrueになったidと一致するものは削除する
    breakfastCategory.removeWhere((element) {
      return (element.id == id && element.isSelected==!isSelected);
    });
    ///改めてisSelected(=true)としてCategoryを新規登録で更新完了
    breakfastCategory.add(
      Category(
        mealType: mealType,
        id: id,
        categoryText: label,
        categoryIcon:  categoryIcon[id-1],
        isSelected: isSelected,
      )
    );

    ///ソートをかけないと元の順番にならない
    breakfastCategory.forEach((category){
      print("${category.id}:${category.categoryText}");
    });

    breakfastCategory.sort((a,b) => a.id.compareTo(b.id));
   print('idでソート後');
    breakfastCategory.forEach((category){
      print("${category.id}:${category.categoryText}");
    });




    notifyListeners();
  }

  Future<void> lunchCategoryTapped(
      {MealType mealType, bool isSelected, String label, int id}) async {
    if (isSelected) {
      lunchCategory.add(Category(
        mealType: mealType,
        id: id,
        categoryText: label,
        categoryIcon:  categories[id-1].categoryIcon,
        isSelected: true,
      ));
    } else {
      lunchCategory.removeWhere((element) => element.id == id);
    }
    notifyListeners();
  }

  Future<void> snackCategoryTapped(
      {MealType mealType, bool isSelected, String label, int id}) async {
    if (isSelected) {
      snackCategory.add(Category(
        mealType: mealType,
        id: id,
        categoryText: label,
        categoryIcon:  categories[id-1].categoryIcon,
        isSelected: true,
      ));
    } else {
      snackCategory.removeWhere((element) => element.id == id);
    }
    notifyListeners();
  }

  Future<void> dinnerCategoryTapped(
      {MealType mealType, bool isSelected, String label, int id}) async {
    if (isSelected) {
      dinnerCategory.add(Category(
        mealType: mealType,
        id: id,
        categoryText: label,
        categoryIcon: categories[id-1].categoryIcon,
        isSelected: true,
      ));
    } else {
      dinnerCategory.removeWhere((element) => element.id == id);
    }
    notifyListeners();
  }


  ///選択ボタンを押したらtrueのみのリストを表示するのではなく、
  ///trueもfalseも存在するカテゴリの中からisSelected:trueのものだけを表示する形へ変更

  Future<void> selectCategory() async {

    //todo breakfastCategoryの中でisSelectedがtrueのものだけを返す
    ///リスト再作成なのか、、リストそのままでtrueだけ選別できるのか
    //trueだけのリストを作るとRangeError
//    breakfastCategory.removeWhere((element) {
//      return  element.isSelected== false;
//    });
//    print('選択ボタン押してtrueのみにしたリスト');
//    breakfastCategory.forEach((category){
//      print("${category.id}:${category.categoryText}");
//    });

    //    if (isSelected) {
//      breakfastCategory.add(Category(
//        mealType: mealType,
//        id: id,
//        categoryText: label,
//        categoryIcon:  categories[id-1].categoryIcon,
//        isSelected: true,
//      ));
//    } else {
//      //elementはリストの中に入ってるCategory一つ一つ、カテゴリー名ではなくid一致するもの削除
//      breakfastCategory.removeWhere((element) => element.id == id);
//    }


//    notifyListeners();
    //todo 選択なしならflutterToast表示
    print('カテゴリー選択ボタン：${breakfastCategory.first.categoryText}');
    //todo 選択したらDBへ登録

  }


}
