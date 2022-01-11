import 'package:crypto_assets_app/app/modules/home/components/crypto_assets_quotation_table/crypto_assets_quotation_table_controller.dart';
import 'package:crypto_assets_app/app/modules/home/components/add_new_crypto_asset_widget/add_new_crypto_asset_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewCryptoAssetBySymbolButton extends StatelessWidget {
  const AddNewCryptoAssetBySymbolButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNewCryptoAssetController>(
      builder: (_, __, child) => ElevatedButton(
        onPressed: _.read<AddNewCryptoAssetController>().isLoading
            ? null
            : () async {
                // context.read<T>() = Provider.of<T>(context, listen = false)
                // read() must be used instead of watch() because the latter may lead to unexpected behavior when used in handlers such as button taps (button rebuilds unnecessarily)
                if (_.read<AddNewCryptoAssetController>().formKey.currentState!.validate()) {
                  if (await _.read<AddNewCryptoAssetController>().addCryptoAssetToListBySymbol(
                          symbol: _
                              .read<AddNewCryptoAssetController>()
                              .addCryptoAssetToListBySymbolTextController
                              .text,
                          cryptoAssetList:
                              _.read<CryptoAssetsQuotationTableController>().cryptoAssets) ==
                      CryptoAssetSearchStatus.error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('There has been an error.')),
                    );
                  }
                }
              },
        child: const Text('Add'),
      ),
    );
  }
}
