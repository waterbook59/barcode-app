import 'package:barcodeapp/style.dart';
import 'package:barcodeapp/views/barcode_read/pages/barcode_read_page.dart';
import 'package:barcodeapp/views/barcord_read/barcode_read_page.dart';
import 'package:barcodeapp/views/data_list/data_list_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    BarcodeReadPage(),
    DataListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon:FaIcon(FontAwesomeIcons.barcode),
                title: Text('読み取り',style: TextStyle(fontFamily: boldFont),)),
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text('データ一覧',style: TextStyle(fontFamily: boldFont))),
          ],
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
        body: _pages[_currentIndex],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex= index;
    });
  }
}