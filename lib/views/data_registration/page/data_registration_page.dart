import 'package:barcodeapp/style.dart';
import 'package:barcodeapp/view_models/data_registration_view_model.dart';
import 'package:barcodeapp/views/common/components/button_with_icon.dart';
import 'package:barcodeapp/views/common/components/imgae_from_url.dart';
import 'package:barcodeapp/views/common/components/picker_form_part.dart';
import 'package:barcodeapp/views/data_registration/components/camera_icon_part.dart';
import 'package:barcodeapp/views/data_registration/components/product_text_part.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DataRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            '商品データを登録',
//            style: TextStyle(fontFamily: boldFont),
          ),
        ),
        body: SingleChildScrollView(
          child: Consumer<DataRegistrationViewModel>(
              builder: (context, model, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //商品画像、検索か自分で設定
                ///バーコード検索結果
                SizedBox(
                    width: 80,
                    height: 80,
                    //todo バーコード検索結果から表示、タップでカメラ起動
                    child: ImageFromUrl(
                      imageUrl: model.productUrl,
                    )),
                ///自分で設定(カメラor選択)
                CameraIconPart(),
                ///商品名
                ProductTextPart(
                  productTextController: model.productNameController,
                  onCancelButtonPressed: () => model.productNameClear(),
                  labelText: '商品名',
                  hintText: '商品名を入力',
                  textInputType: TextInputType.text,
                ),
                ///期限
                PickerFormPart(
                  dateEditController: model.dateEditController,
                  onCancelButtonPressed: () => model.dateClear(),
                  dateTime: model.validDateTime,
                  dateChanged: (newDateTime) => model.dateChange(newDateTime),
                ),
                ///数量
                ProductTextPart(
                  productTextController: model.productNumberController,
                  onCancelButtonPressed: () => model.productNumberClear(),
                  labelText: '数量',
                  hintText: '数量を入力',
                  textInputType: TextInputType.number,
                ),
                //商品画像と商品名をバーコードから入手ボタン
                const SizedBox(
                  height: 20,
                ),
                ///バーコード読み取りボタン
                ButtonWithIcon(
                  label:'バーコードで商品情報読み込み',
                  icon: const FaIcon(FontAwesomeIcons.barcode),
                  buttonColor: Colors.orangeAccent,
                  onPressed: () =>getProductInfo(context),
                ),
                const SizedBox(
                  height: 20,
                ),
                ///保存ボタン
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(15)),
                  child: const Text('保存'),
                  onPressed: () => registerProductData(context),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Future<void> registerProductData(BuildContext context) async {
    final viewModel =
        Provider.of<DataRegistrationViewModel>(context, listen: false);
    //todo テキストデータ(渡さなくてもviewModelから直接取れば良い？)
    await viewModel.registerProductData();
  }

  Future<void> getProductInfo(BuildContext context) async{
    print('バーコードスキャンでgetProductInfo');
  }
}
