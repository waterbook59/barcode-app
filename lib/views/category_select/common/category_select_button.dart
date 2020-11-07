import 'package:flutter/material.dart';

class CategorySelectButton extends StatelessWidget {
  const CategorySelectButton({this.categoryTap, this.icon, this.label});

//  final ValueChanged<String> categoryTap;
  //todo valuechangeまたはタップで色の入れ替え
  final VoidCallback categoryTap;
  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: categoryTap ,
      child: Container(
        decoration: BoxDecoration(
          // 選択前:背景色透明、選択時:背景色を青にする
          color: Colors.blue,
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8)),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                icon,
                SizedBox(height: 10,),
                Text(label,style: TextStyle(fontSize: 10),),

              ],
            )
          ),
        ),
        ),
      );
  }
}

