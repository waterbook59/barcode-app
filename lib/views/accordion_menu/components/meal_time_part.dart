import 'package:barcodeapp/views/common/components/circle_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealTimePart extends StatelessWidget {
  final String mealTime;


  MealTimePart({this.mealTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(mealTime),
              CircleIconButton(icon: Icons.add,),

            ],
          ),
        ],
      ),
    );
  }
}
