import 'package:crypto_assets_app/app/shared/constants.dart';
import 'package:intl/intl.dart';

class TextFormattingUtils {
  static doubleToCurrency({required double value}) {
    final _numberFormat = NumberFormat.currency(locale: locale);

    return _numberFormat.format(value);
  }
}
