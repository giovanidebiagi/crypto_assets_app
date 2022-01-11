import 'package:crypto_assets_app/app/data/models/crypto_asset_model.dart';
import 'package:crypto_assets_app/app/modules/home/components/crypto_assets_quotation_table/crypto_assets_quotation_table_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RemoveCryptoAssetFromListConfirmationDialog extends StatelessWidget {
  final CryptoAssetModel cryptoAsset;

  const RemoveCryptoAssetFromListConfirmationDialog({required this.cryptoAsset, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const BeveledRectangleBorder(),
      title: RichText(
        text: TextSpan(
          text: 'Tem certeza que deseja excluir o ativo ',
          children: [
            TextSpan(
              text: cryptoAsset.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const TextSpan(text: '?'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancelar',
            style: TextStyle(
              color: Color.fromRGBO(80, 80, 80, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color.fromRGBO(232, 94, 94, 1),
            ),
          ),
          onPressed: () {
            Provider.of<CryptoAssetsQuotationTableController>(context, listen: false)
                .removeCryptoAssetFromList(cryptoAsset);
            Navigator.pop(context);
          },
          child: const Text('Confirmar'),
        )
      ],
    );
  }
}
