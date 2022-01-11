import 'package:crypto_assets_app/app/modules/home/components/crypto_assets_quotation_table/crypto_assets_quotation_table_controller.dart';
import 'package:crypto_assets_app/app/modules/home/components/add_new_crypto_asset_widget/add_new_crypto_asset_widget.dart';
import 'package:crypto_assets_app/app/shared/routes.dart';
import 'package:crypto_assets_app/app/shared/widgets/default_app_bar_controller/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/crypto_assets_quotation_table/crypto_assets_quotation_table.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future _getCryptoAssets;

  @override
  void initState() {
    _getCryptoAssets = Provider.of<CryptoAssetsQuotationTableController>(context, listen: false)
        .generateCryptoAssetsDataMock();
    // Provider.of<CryptoAssetsQuotationController>(context, listen: false)
    //     .fetchCryptoAssetsData(CRYPTO_ASSETS_SYMBOLS);

    super.initState();
  }

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
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: FutureBuilder(
                  future: _getCryptoAssets,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Loading...');
                    }

                    return const CryptoAssetsQuotationTable();
                  },
                ),
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
