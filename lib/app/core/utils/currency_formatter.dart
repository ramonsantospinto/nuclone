import 'package:intl/intl.dart';

abstract class CurrencyFormatter {
  static final _brlFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

  static String format(double value) {
    return _brlFormat.format(value);
  }
}
