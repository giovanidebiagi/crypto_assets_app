import 'package:crypto_assets_app/app/data/models/crypto_asset_model.dart';

abstract class ICryptoAssetsRepository {
  Future<List<CryptoAssetModel>> getAllCryptoAssetsData(
      {required List<String> cryptoAssetsSymbols});

  Future<CryptoAssetModel> getCryptoAssetData({required String cryptoAssetSymbol});
}
