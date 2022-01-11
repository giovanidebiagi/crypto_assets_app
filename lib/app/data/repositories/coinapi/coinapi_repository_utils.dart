import 'package:crypto_assets_app/app/data/models/crypto_asset_model.dart';
import 'dart:convert';

class CoinapiRepositoryUtils {
  static CryptoAssetModel convertCoinapiResponseToCryptoAssetModel(
      String responseStr, String cryptoAssetSymbol) {
    final List _listOfCryptoAssets = json.decode(responseStr);

    //TODO: handle _cryptoAssetModel not found in json

    late CryptoAssetModel _cryptoAssetModel;

    for (final cryptoAsset in _listOfCryptoAssets) {
      if (cryptoAsset['asset_id'] == cryptoAssetSymbol) {
        _cryptoAssetModel = CryptoAssetModel(
          symbol: cryptoAssetSymbol,
          name: cryptoAsset['name'],
          currentPrice: cryptoAsset['price_usd'],
        );
      }
    }

    return _cryptoAssetModel;
  }
}
