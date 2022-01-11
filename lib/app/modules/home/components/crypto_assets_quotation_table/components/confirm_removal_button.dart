import 'package:crypto_assets_app/app/data/models/crypto_asset_model.dart';
import 'package:crypto_assets_app/app/modules/home/components/crypto_assets_quotation_table/crypto_assets_quotation_table_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmRemovalButton extends StatelessWidget {
  final CryptoAssetModel cryptoAsset;

  const ConfirmRemovalButton({required this.cryptoAsset, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = context.watch<CryptoAssetsQuotationTableController>();

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color.fromRGBO(232, 94, 94, 1),
        ),
      ),
      onPressed: () {
        _controller.removeCryptoAssetFromList(cryptoAsset);
      },
      child: const Text('Confirmar'),
    );
  }
}
