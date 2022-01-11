import 'package:crypto_assets_app/app/data/models/crypto_asset_model.dart';
import 'package:flutter/material.dart';

class DefaultAppBarController with ChangeNotifier {
  CryptoAssetModel? mostExpensiveCryptoAsset;

  void getMostExpensiveCryptoAsset(List<CryptoAssetModel> cryptoAssets) {
    CryptoAssetModel? _mostExpensiveCryptoAsset;
    double _previousCryptoAssetPrice = 0;

    for (CryptoAssetModel cryptoAsset in cryptoAssets) {
      if (cryptoAsset.currentPrice > _previousCryptoAssetPrice) {
        _previousCryptoAssetPrice = cryptoAsset.currentPrice;
        _mostExpensiveCryptoAsset = cryptoAsset;
      }
    }

    mostExpensiveCryptoAsset = _mostExpensiveCryptoAsset;

    notifyListeners();
  }
}
