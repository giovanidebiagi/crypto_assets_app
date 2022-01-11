import 'package:crypto_assets_app/app/modules/home/components/add_new_crypto_asset_widget/add_new_crypto_asset_widget.dart';
import 'package:crypto_assets_app/app/shared/routes.dart';
import 'package:crypto_assets_app/app/shared/widgets/default_app_bar_controller/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'components/crypto_assets_quotation_table/crypto_assets_quotation_table.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'All Crypto Assets',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: CryptoAssetsQuotationTable(),
              ),
              const AddNewCryptoAssetWidget(),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, secondPage);
                },
                child: const Text('Navigate to second page'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
