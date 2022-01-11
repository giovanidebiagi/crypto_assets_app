import 'package:crypto_assets_app/app/data/models/crypto_asset_model.dart';

import 'package:crypto_assets_app/app/data/repositories/i_crypto_assets_repository.dart';
import 'package:flutter/material.dart';

enum CryptoAssetSearchStatus { error, notFound, success }

class CryptoAssetsQuotationTableController with ChangeNotifier {
  final ICryptoAssetsRepository cryptoAssetsRepository;

  CryptoAssetsQuotationTableController(this.cryptoAssetsRepository);

  List<CryptoAssetModel> cryptoAssets = [];

  Future<void> fetchCryptoAssetsData(List<String> cryptoAssetsSymbols) async {
    try {
      var _cryptoAssetsData = await cryptoAssetsRepository.getAllCryptoAssetsData(
          cryptoAssetsSymbols: cryptoAssetsSymbols);

      cryptoAssets = _cryptoAssetsData;

      notifyListeners();
    } catch (e) {
      throw (Exception('There has been an error on getAllCryptoAssetsData: $e'));
    }
  }

  Future<void> generateCryptoAssetsDataMock() async {
    await Future.delayed(const Duration(seconds: 0));

    cryptoAssets = [
      CryptoAssetModel(symbol: 'BTC', name: 'Bitcoin', currentPrice: 40187.34),
      CryptoAssetModel(symbol: 'ETH', name: 'Ethereum', currentPrice: 3091.45),
      CryptoAssetModel(symbol: 'SPELL', name: 'Spell Token', currentPrice: 0.02),
    ];

    notifyListeners();
  }

  Future<void> removeCryptoAssetFromList(CryptoAssetModel cryptoAsset) async {
    cryptoAssets.remove(cryptoAsset);

    notifyListeners();
  }

  void updateCryptoAssets() {
    notifyListeners();
  }
}
