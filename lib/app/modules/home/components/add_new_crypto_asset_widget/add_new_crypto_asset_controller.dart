import 'package:crypto_assets_app/app/data/models/crypto_asset_model.dart';
import 'package:crypto_assets_app/app/modules/home/components/crypto_assets_quotation_table/crypto_assets_quotation_table_controller.dart';
import 'package:crypto_assets_app/app/data/repositories/i_crypto_assets_repository.dart';
import 'package:flutter/material.dart';

class AddNewCryptoAssetController with ChangeNotifier {
  final ICryptoAssetsRepository cryptoAssetsRepository;
  bool isLoading = false;

  AddNewCryptoAssetController(this.cryptoAssetsRepository);

  final formKey = GlobalKey<FormState>();
  TextEditingController addCryptoAssetToListBySymbolTextController = TextEditingController();

  Future addCryptoAssetToListBySymbol(
      {required String symbol, required List<CryptoAssetModel> cryptoAssetList}) async {
    try {
      isLoading = true;
      notifyListeners();

      CryptoAssetModel _cryptoAsset =
          await cryptoAssetsRepository.getCryptoAssetData(cryptoAssetSymbol: symbol.toUpperCase());

      cryptoAssetList.add(_cryptoAsset);

      isLoading = false;

      notifyListeners();

      return CryptoAssetSearchStatus.success;
    } catch (e) {
      isLoading = false;
      return CryptoAssetSearchStatus.error;
    }
  }
}
