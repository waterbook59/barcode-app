import 'package:barcodeapp/data_models/category_list.dart';
import 'package:barcodeapp/util/constants.dart';
import 'package:barcodeapp/views/accordion_menu/components/meal_time_part.dart';
import 'package:barcodeapp/views/accordion_menu/components/radius_expansion_tile.dart';
import 'package:barcodeapp/views/accordion_menu/components/select_category_part.dart';
import 'package:barcodeapp/views/category_select/screens/category_select_screen.dart';
import 'package:flutter/material.dart';
//import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';

class AccordionMenu extends StatefulWidget {
  AccordionMenu({this.categoryResult});

  List<Category> categoryResult;

  @override
  _AccordionMenuState createState() => _AccordionMenuState();
}

class _AccordionMenuState extends State<AccordionMenu> {
  @override
  Widget build(BuildContext context) {
    //todo categoryResultの中身をどこかで空にしないとcategoryResulutの中身がどんどん増えていく
    print('カテゴリー選択から得たデータ：${widget.categoryResult}');

    ///カテゴリ追加ボタンを押すときにMealTypeを渡す
    MealType mealType;

    return Scaffold(
      appBar: AppBar(
        title: Text('Configurable Expansion Tile Demo'),
      ),
      floatingActionButton: const FloatingActionButton(
        //todo
        onPressed: null,
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
//                border: Border.all(color: Colors.blue),
//                borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  child: RadiusExpansionTile(
//            borderColorStart: Colors.blue,
//            borderColorEnd: Colors.orange,
                      animatedWidgetFollowingHeader: const Icon(
                        Icons.expand_more,
                        color: const Color(0xFF707070),
                      ),
                      headerExpanded: Flexible(
                          child: Container(
                              decoration: BoxDecoration(
//                      border: Border.all(color: Colors.purpleAccent),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 50,
                              child: Center(child: Text('メニュー')))),
                      header: Flexible(
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 50,
//                  color: Colors.transparent,
                            child: Center(child: Text("１日目"))),
                      ),
//                headerBackgroundColorStart: Colors.grey,
//                expandedBackgroundColor: Colors.amber,
//                headerBackgroundColorEnd: Colors.teal,
                      children: [
                        Column(
                          children: <Widget>[
                            Column(
                              children: [
                                MealTimePart(
                                  mealTime: '朝',
                                  backgroundColor: Colors.orangeAccent,
                                  ///ここでMealType.breakfastを渡す
                                  onAdd: () {
                                    mealType = MealType.breakfast;
                                    addCategory(context, mealType);
                                  },
                                ),
                                ///categoryResultがnullじゃないときカテゴリ選択結果表示
                                widget.categoryResult==null
                                  ? Container()
                                    : SelectCategoryPart(
                                  categoryResult: widget.categoryResult,
                                ),


                              ],
                            ),
                            const Divider(
                              height: 10,
                            ),
                            MealTimePart(
                              mealTime: '昼',
                            ),
                            const Divider(),
                            MealTimePart(
                              mealTime: '間食',
                            ),
                            const Divider(),
                            Row(children: <Widget>[const Text('夜')]),
                          ],
                        ),
                      ]),
                ))
          ],
        ),
      ),
    );
  }

  //todo タップするとカテゴリ追加ページに
  void addCategory(BuildContext context, MealType mealType) {
    print('タップするとカテゴリ追加ページに');
//    Navigator.push<dynamic>(context,
//      //todo たぶんenumでステータス渡しといた方が良い
//      MaterialPageRoute<dynamic>(builder: (context) => CategorySelectScreen()),
//    );
    Navigator.pushReplacement<dynamic, dynamic>(
        context,
        MaterialPageRoute<dynamic>(
            builder: (context) => CategorySelectScreen(mealType: mealType)));
  }
}
