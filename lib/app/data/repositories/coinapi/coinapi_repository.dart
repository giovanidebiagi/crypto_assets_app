import 'package:crypto_assets_app/app/data/models/crypto_asset_model.dart';
import 'package:crypto_assets_app/app/services/http_services/i_http_service.dart';
import 'package:crypto_assets_app/app/shared/constants.dart';
import 'package:crypto_assets_app/app/shared/secrets.dart';
import '../i_crypto_assets_repository.dart';
import 'coinapi_repository_utils.dart';

class CoinapiRepository implements ICryptoAssetsRepository {
  final IHttpService httpService;

  CoinapiRepository(this.httpService);

  @override
  Future<CryptoAssetModel> getCryptoAssetData({required String cryptoAssetSymbol}) async {
    var _responseStr = await httpService.get(
      url: '$coinapiApiUrl/$cryptoAssetSymbol',
      headers: {
        'X-CoinAPI-Key': coinapiApiKey,
      },
    );

    return CoinapiRepositoryUtils.convertCoinapiResponseToCryptoAssetModel(
        _responseStr, cryptoAssetSymbol);
  }

  @override
  Future<List<CryptoAssetModel>> getAllCryptoAssetsData(
      {required List<String> cryptoAssetsSymbols}) async {
    List<CryptoAssetModel> _cryptoAssetsList = [];

// Create a deep copy of cryptoAssetsSymbols and concatenate its elements into a String (HTTP POST parameter)
    String _joinedCryptoAssetsSymbols = [...cryptoAssetsSymbols].join(',');

    var _responseStr = await httpService.get(url: coinapiApiUrl, headers: {
      'X-CoinAPI-Key': coinapiApiKey,
    }, queryParameters: {
      'filter_asset_id': _joinedCryptoAssetsSymbols,
    });

    for (final String cryptoAssetSymbol in cryptoAssetsSymbols) {
      _cryptoAssetsList.add(
        CoinapiRepositoryUtils.convertCoinapiResponseToCryptoAssetModel(
            _responseStr, cryptoAssetSymbol),
      );
    }

    return _cryptoAssetsList;
  }
}
