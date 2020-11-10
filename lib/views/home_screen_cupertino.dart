import 'package:barcodeapp/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'accordion_menu/page/accordinon_menu.dart';
import 'barcode_read/pages/barcode_read_page.dart';
import 'data_list/data_list_page.dart';
import 'data_registration/page/data_registration_page.dart';

class HomeScreenCupertino extends StatefulWidget {
  @override
  _HomeScreenCupertinoState createState() => _HomeScreenCupertinoState();
}

class _HomeScreenCupertinoState extends State<HomeScreenCupertino> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    DataRegistration(),
    BarcodeReadPage(),
    DataListPage(),
    AccordionMenu(),
  ];

  @override
  Widget build(BuildContext context) {
    return
      /// 画面遷移してもBottomNavigationBar残すならCupertinoが良さそう
      CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon:FaIcon(FontAwesomeIcons.edit),
                title: Text('データ登録',style: TextStyle(fontFamily: boldFont),)),
            BottomNavigationBarItem(
                icon:FaIcon(FontAwesomeIcons.barcode),
                title: Text('読み取り',style: TextStyle(fontFamily: boldFont),)),
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text('データ一覧',style: TextStyle(fontFamily: boldFont))),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance),
                title: Text('アコーディオン',style: TextStyle(fontFamily: boldFont))),
          ],
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
        tabBuilder:(context,index){
              return CupertinoTabView(
                builder: (context){
                return CupertinoPageScaffold(
                  child: _pages[index],
                );

//                  switch(index){
//                    case 0:
//                      return  DataRegistration();
//                      break;
//                    case 1:
//                      return  BarcodeReadPage();
//                      break;
//                }
//                },
//              );
//
//          return _pages[index];
          }



      );
  }
      );
    

}
  void _onItemTapped(int index) {
        setState(() {
      _currentIndex= index;
    });
  }

  }


