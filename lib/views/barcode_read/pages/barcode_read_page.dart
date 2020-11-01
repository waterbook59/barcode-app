import 'package:barcodeapp/view_models/barcode_read_view_model.dart';
import 'package:barcodeapp/views/barcode_read/components/scan_start_button.dart';
import 'package:barcodeapp/views/barcode_read/components/search_bar_part.dart';
import 'package:barcodeapp/views/read_result/page/read_result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

class BarcodeReadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'バーコード読み取り',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                ScanStartButton(
                onPressed: () => scanStart(context),
                label: 'Scan!!!',
                fontSize: 18,
              ),
                Consumer<BarcodeReadViewModel>(
                  builder: (context,model,child){
                    return SearchBarPart(
                      onSearch: (keyword) => getKeywordProduct(context, keyword),
                      //テキストを結局model層へセット
                      textEditingController: model.keywordController,
                      errorText: model.isValidation ? model.strValidateName : null,
                      didChanged: (updateKeyword) =>
                           updateValidateKeyword(context, updateKeyword),
                    );
                  },
                ),
            ]),
        ),
      ),
    );
  }

  //todo 押したらリーダー立ち上げて読み取り
  //todo JANコード結果を出さずに商品結果だけを出す
  Future<void> scanStart(BuildContext context) async {
    final viewModel = Provider.of<BarcodeReadViewModel>(context, listen: false);
    await viewModel.scanStart();

    // キャンセルボタンを押下された時はページ移行しない
if(viewModel.barcodeScanRes!='-1'){
  Navigator.push(context,MaterialPageRoute<void>(
      builder: (context) => ReadResultPage(
        barcodeScanRes: viewModel.barcodeScanRes,
      )));
}


    print('barcodeScanRes:${viewModel.barcodeScanRes}');
  }

  //todo キーワード検索:上位5~10件引っ張ってきて選択=>readResultPageと同じ表示
  Future<void> getKeywordProduct(BuildContext context, String keyword) async{
    print('キーワード検索：$keyword');
  }

  //todo キーワードアップデート検索
  Future<void> updateValidateKeyword(BuildContext context, String updateKeyword) async{
    print('updateキーワード検索：$updateKeyword');
  }
}
