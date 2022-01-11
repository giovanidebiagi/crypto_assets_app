import 'dart:convert';

class CryptoAssetModel {
  String symbol;
  String name;
  double currentPrice;

  CryptoAssetModel({
    required this.symbol,
    required this.name,
    required this.currentPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'symbol': symbol,
      'name': name,
      'currentPrice': currentPrice,
    };
  }

  factory CryptoAssetModel.fromMap(Map<String, dynamic> map) {
    return CryptoAssetModel(
      symbol: map['symbol'] ?? '',
      name: map['name'] ?? '',
      currentPrice: map['currentPrice']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoAssetModel.fromJson(String source) => CryptoAssetModel.fromMap(json.decode(source));
}
