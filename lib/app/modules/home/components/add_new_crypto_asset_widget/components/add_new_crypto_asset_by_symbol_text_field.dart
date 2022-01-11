import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../add_new_crypto_asset_controller.dart';

class AddNewCryptoAssetBySymbolTextField extends StatelessWidget {
  const AddNewCryptoAssetBySymbolTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Crypto Asset Symbol'),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Symbol must not be empty';
          }
          return null;
        },
        controller:
            context.watch<AddNewCryptoAssetController>().addCryptoAssetToListBySymbolTextController,
      ),
    );
  }
}
