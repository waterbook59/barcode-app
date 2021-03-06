import 'dart:io';

import 'package:barcodeapp/models/db/product_info/product_info_dao.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'product_info_database.g.dart';

//テーブルProductRecords
class ProductRecords extends Table{
  TextColumn get productId => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();

  @override
  Set<Column> get primaryKey => {productId};
}

//テーブルProductRecordImages
class ProductRecordImages extends Table{
  TextColumn get productId => text()();
  TextColumn get imageId => text()();
  TextColumn get small => text()();
  TextColumn get medium => text()();

  @override
  Set<Column> get primaryKey => {imageId};
}

///テーブルじゃなくて結合クラス
class JoinedProduct{
  final ProductRecord productRecord;
  final ProductRecordImage productRecordImage;
  JoinedProduct({this.productRecord,this.productRecordImage});
}

@UseMoor(tables:[ProductRecords,ProductRecordImages],daos:[
  ProductInfoDao] )
class MyProductInfoDB extends _$MyProductInfoDB {
  MyProductInfoDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;

}


LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    //下はpath_providerの一般的な書き方
    final file = File(p.join(dbFolder.path, 'product_info.db'));
    return VmDatabase(file);
  });
}