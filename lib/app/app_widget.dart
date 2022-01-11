import 'package:crypto_assets_app/app/modules/second/second_page.dart';
import 'package:crypto_assets_app/app/services/http_services/dio_service.dart';
import 'package:crypto_assets_app/app/shared/widgets/default_app_bar_controller/default_app_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/repositories/coinapi/coinapi_repository.dart';
import 'modules/home/components/crypto_assets_quotation_table/crypto_assets_quotation_table_controller.dart';
import 'modules/home/components/add_new_crypto_asset_widget/add_new_crypto_asset_controller.dart';
import 'modules/home/home_page.dart';
import 'shared/routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddNewCryptoAssetController>(
          create: (_) => AddNewCryptoAssetController(
            CoinapiRepository(
              DioService(),
              // HttpService(),
            ),
          ),
        ),
        ChangeNotifierProxyProvider<AddNewCryptoAssetController,
            CryptoAssetsQuotationTableController>(
          create: (_) => CryptoAssetsQuotationTableController(
            CoinapiRepository(
              DioService(),
            ),
          ),
          update: (_, listOfCryptoAssets, cryptoAssetsQuotationController) =>
              cryptoAssetsQuotationController!..updateCryptoAssets(),
        ),
        ChangeNotifierProxyProvider<CryptoAssetsQuotationTableController, DefaultAppBarController>(
          create: (_) => DefaultAppBarController(),
          update: (_, cryptoAssetsQuotationTableController, defaultAppBarController) =>
              defaultAppBarController!
                ..getMostExpensiveCryptoAsset(cryptoAssetsQuotationTableController.cryptoAssets),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(5, 6, 49, 1),
          ),
        ),
        home: const HomePage(),
        routes: {
          secondPage: (context) => const SecondPage(),
        },
      ),
    );
  }
}
