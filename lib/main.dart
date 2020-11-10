import 'package:barcodeapp/di/providers.dart';
import 'package:barcodeapp/localize/fallback_cupertino_localisations.dart';
import 'package:barcodeapp/style.dart';
import 'package:barcodeapp/view_models/barcode_read_view_model.dart';
import 'package:barcodeapp/view_models/data_registration_view_model.dart';
import 'package:barcodeapp/view_models/read_result_view_model.dart';
import 'package:barcodeapp/views/home_screen.dart';
import 'package:barcodeapp/views/home_screen_cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'localize/japanese_cupertion_localizations.dart'
    as jcl; //(ほかのライブラリと競合したのでas jclとしている)

//import 'di/providers.dart';

void main() {
  runApp(
///diなしviewModelが１つだけ
//      ChangeNotifierProvider<BarcodeReadViewModel>(
//        create: (context)=>BarcodeReadViewModel(),
//         child: MyApp(),
//  )
///diなしviewModelが２つ以上
//      MultiProvider(
//        providers: [
//          ChangeNotifierProvider<DataRegistrationViewModel>(
//            create: (context)=> DataRegistrationViewModel(),
//          ),
//          ChangeNotifierProvider<BarcodeReadViewModel>(
//            create: (context) => BarcodeReadViewModel(),
//          ),
//          ChangeNotifierProvider<ReadResultViewModel>(
//            create: (context) => ReadResultViewModel(),
//          ),
//        ],
//        child: MyApp(),
//  ));
  ///diあり
  MultiProvider(
    providers: globalProviders,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
         GlobalMaterialLocalizations.delegate,
         GlobalWidgetsLocalizations.delegate,
///DefaultCupertinoLocalizations.delegateとjcl記載ならcupertinoTabbar使用でエラー
///GlobalCupertionLocalizations.delegate記載ならエラーにはならないが、pickerは年が右に...
        ///picker日本語化とcupertinoTabbarの両立ができない
//        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        jcl.JapaneseCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('ja', 'JP'),
      ],
      locale: Locale('ja', 'JP'),
      title: 'Barcode App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: regularFont,
      ),
      ///jcl.JapaneseCupertinoLocalizations.delegateをそのまま使いながら
        ///cupertinoTabbar使用が難しい
//      home:HomeScreenCupertino(),
     home: HomeScreen(),
    );
  }
}
