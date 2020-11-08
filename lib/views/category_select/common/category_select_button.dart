import 'package:flutter/material.dart';

class CategorySelectButton extends StatelessWidget {
  const CategorySelectButton({this.categoryTap, this.icon, this.label, this.isSelected});

///  ValueChanged<String>とは書かず、Function(返したい値)
  // valueChangeまたはタップで色の入れ替え
  final Function(bool) categoryTap;
  final Widget icon;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      //後ろの()がないと反応しない
      onTap: ()=>categoryTap(isSelected),
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          // 選択前:背景色透明、選択時:背景色を青にする
          color: isSelected ? Colors.blue :Colors.transparent,
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

