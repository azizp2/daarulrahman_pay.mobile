import 'package:intl/intl.dart';

class CurrencyHelper {
  static String _currencyCode = 'IDR';
  static String _symbol = 'Rp ';
  static String _locale = 'id_ID';
  static int _decimalDigits = 2;

  static void setCurrency({
    required String currencyCode,
    required String symbol,
    required String locale,
    int decimalDigits = 2,
  }) {
    _currencyCode = currencyCode;
    _symbol = symbol;
    _locale = locale;
    _decimalDigits = decimalDigits;
  }

  static NumberFormat get formatter {
    return NumberFormat.currency(
      locale: _locale,
      symbol: _symbol,
      decimalDigits: _decimalDigits,
      name: _currencyCode,
    );
  }

  static String format(num value) {
    return formatter.format(value);
  }

  static int parse(String text) {
    return int.parse(text.replaceAll(RegExp(r'[^0-9]'), ''));
  }

  static String get currentCurrency => _currencyCode;
}
