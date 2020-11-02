import 'package:barcodeapp/view_models/data_registration_view_model.dart';
import 'package:barcodeapp/views/data_registration/components/product_name_part.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle:true,
          title: const Text('商品データを登録'),
        ),
        body: Consumer<DataRegistrationViewModel>(
        builder: (context,model,child){
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //商品画像、検索か自分で設定
              SizedBox(width: 80, height: 80,
                //todo バーコード検索結果から表示
//                child: ImageFromUrl(imageUrl: widget._productUrl,)
              ),
              //商品名
              ProductNamePart(
                productNameController: model.productNameController,
                onCancelButtonPressed:()=> model.productNameClear(),
              ),
              //期限
              //数量
              //商品画像と商品名をバーコードから入手

            ],
          );
        }

      ),
      ),);
  }
}
