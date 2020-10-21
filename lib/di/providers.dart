import 'package:barcodeapp/models/repository/barcode_repository.dart';
import 'package:barcodeapp/view_models/barcode_read_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];


List<SingleChildWidget> independentModels =[
//  Provider<MyDatabase>(
//    create: (_)=>MyDatabase(),
//    dispose: (_,db) =>db.close(),
//  ),
];

List<SingleChildWidget> dependentModels = [
//  ProxyProvider<MyDatabase,BarcodeDao>(
//    update: (_, db, dao)=>BarcodeDao(db),
//  ),
//  ProxyProvider<BarcodeDao,BarcodeRepository>(
//    update: (_, dao, repository)=>BarcodeRepository(dao: dao),
//  ),
];

//chapter98 RepositoryにChangeNotifierProxyProvider
List<SingleChildWidget> viewModels =[

//  ChangeNotifierProvider<BarcodeReadViewModel>(
//    create: (context)=> BarcodeReadViewModel(
//      repository:Provider.of<BarcodeRepository>(context, listen: false),
//    ),
//  ),

];
