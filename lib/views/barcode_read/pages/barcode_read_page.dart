import 'package:barcodeapp/view_models/barcode_read_view_model.dart';
import 'package:barcodeapp/views/barcode_read/components/scan_start_button.dart';
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
            child: ScanStartButton(
          onPressed: () => scanStart(context),
          label: 'Scan!!!',
          fontSize: 18,
        )),
      ),
    );
  }

  //todo 押したらリーダー立ち上げて読み取り
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
}
