import 'package:barcodeapp/models/db/product_info/product_info_dao.dart';
import 'package:barcodeapp/models/db/product_info/product_info_database.dart';
import 'package:barcodeapp/models/networking/product_info_api_service.dart';
import 'package:barcodeapp/models/repository/barcode_repository.dart';
import 'package:barcodeapp/view_models/barcode_read_view_model.dart';
import 'package:barcodeapp/view_models/category_select_view_model.dart';
import 'package:barcodeapp/view_models/data_registration_view_model.dart';
import 'package:barcodeapp/view_models/read_result_view_model.dart';
import 'package:barcodeapp/views/data_registration/page/data_registration_page.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];


List<SingleChildWidget> independentModels =[
  Provider<ProductApiService>(
    create: (_)=>ProductApiService.create(),
    dispose: (_, productApiService)=>productApiService.dispose(),
  ),

  Provider<MyProductInfoDB>(
    create: (_)=>MyProductInfoDB(),
    dispose: (_,db) =>db.close(),
  ),
];

List<SingleChildWidget> dependentModels = [
  ProxyProvider<MyProductInfoDB,ProductInfoDao>(
    update: (_, db, dao)=>ProductInfoDao(db),
  ),
//  ProxyProvider<BarcodeDao,BarcodeRepository>(
//    update: (_, dao, repository)=>BarcodeRepository(dao: dao),
//  ),
  ProxyProvider2<ProductApiService,ProductInfoDao,BarcodeRepository>(
    update: (_, productApiService,dao, repository)=>BarcodeRepository(
        productApiService: productApiService,productInfoDao:dao),
  ),
];

//chapter98 RepositoryにChangeNotifierProxyProvider
List<SingleChildWidget> viewModels =[

  ChangeNotifierProvider<BarcodeReadViewModel>(
    create: (context)=> BarcodeReadViewModel(
      repository:Provider.of<BarcodeRepository>(context, listen: false),
    ),
  ),
  ChangeNotifierProvider<DataRegistrationViewModel>(
    create: (context)=> DataRegistrationViewModel(
      repository:Provider.of<BarcodeRepository>(context, listen: false),
    ),
  ),
  ChangeNotifierProvider<ReadResultViewModel>(
  create: (context)=> ReadResultViewModel(
  repository:Provider.of<BarcodeRepository>(context, listen: false),
    ),
  ),
  ChangeNotifierProvider<CategorySelectViewModel>(
    create: (context)=> CategorySelectViewModel(
      repository:Provider.of<BarcodeRepository>(context, listen: false),
    ),
  ),


];
