import 'package:crypto_assets_app/app/modules/home/components/add_new_crypto_asset_widget/add_new_crypto_asset_controller.dart';
import 'package:crypto_assets_app/app/modules/home/components/add_new_crypto_asset_widget/components/add_new_crypto_asset_by_symbol_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/add_new_crypto_asset_by_symbol_button.dart';

class AddNewCryptoAssetWidget extends StatelessWidget {
  const AddNewCryptoAssetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Text(
          'Add new Crypto Asset by symbol',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
        child: Form(
          key: context.watch<AddNewCryptoAssetController>().formKey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              AddNewCryptoAssetBySymbolTextField(),
              SizedBox(width: 30.0),
              AddNewCryptoAssetBySymbolButton()
            ],
          ),
        ),
      ),
    ]);
  }
}
