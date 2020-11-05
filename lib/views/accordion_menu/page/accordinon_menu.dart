import 'package:barcodeapp/views/accordion_menu/components/meal_time_part.dart';
import 'package:barcodeapp/views/accordion_menu/components/radius_expansion_tile.dart';
import 'package:flutter/material.dart';
//import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';

class AccordionMenu extends StatefulWidget {
  @override
  _AccordionMenuState createState() => _AccordionMenuState();
}

class _AccordionMenuState extends State<AccordionMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurable Expansion Tile Demo'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10,),
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
              headerExpanded:
              Flexible(child: Container(
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
              headerBackgroundColorStart: Colors.grey,
              expandedBackgroundColor: Colors.amber,
              headerBackgroundColorEnd: Colors.teal,
              children: [
                 Column(children: <Widget>[
                   MealTimePart(mealTime: '朝',),
                   const Divider(),
                   MealTimePart(mealTime: '昼',),
                   const Divider(),
                   MealTimePart(mealTime: '間食',),
                   const Divider(),
                   Row(
                    children: <Widget>[const Text('夜')]),

              ],
      ),
            ]),
    ))],
    )
    ,
    )
    ,
    );
  }
}
