
import 'package:barcodeapp/models/db/product_info/product_info_database.dart';
import 'package:moor/moor.dart';


part 'product_info_dao.g.dart';

@UseDao(tables:[ProductRecords,ProductRecordImages])
class ProductInfoDao extends DatabaseAccessor<MyProductInfoDB> with _$ProductInfoDaoMixin {
  ProductInfoDao(MyProductInfoDB infoDB) : super(infoDB);

  Future<void> clearProductDB() {
    return delete(productRecords).go();
  }

  Future<void> clearImageDB() {
    return delete(productRecordImages).go();
  }

  Future<void> insertProductDB(List<ProductRecord> products) async {
    //2行以上なのでbatch
    await batch((batch) {
      batch.insertAll(productRecords, products);
    });
  }

  Future<void> insertImageDB(List<ProductRecordImage> productImages) async {
    //2行以上なのでbatch
    await batch((batch) {
      batch.insertAll(productRecordImages, productImages);
    });
  }


  Future<void> insertDB(List<ProductRecord> products,
      List<ProductRecordImage> productImages) =>
      transaction(() async {
        await clearProductDB();
        await clearImageDB();
        await insertProductDB(products);
        await insertImageDB(productImages);
      });

  Future<List<JoinedProduct>> getJoinedProduct()  async{
    final query = select(productRecords).join([
      innerJoin(productRecordImages,
          productRecordImages.productId.equalsExp(productRecords.productId)),
    ]);
    //print('query:${query.toString()}'); //queryはJoinedSelectStatement
    final rows = await query.get();
    var data = rows.map((resultRow) {
      return JoinedProduct(
        productRecord: resultRow.readTable(productRecords),
        productRecordImage: resultRow.readTable(productRecordImages),
      );
    }).toList();
    return data;
  }



}

