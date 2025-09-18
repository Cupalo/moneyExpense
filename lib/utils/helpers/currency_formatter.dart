import 'package:intl/intl.dart';

/// Centralized currency formatting utility following KISS principles.
class CurrencyFormatter {
  // Private constructor to prevent instantiation.
  CurrencyFormatter._();

  /// Indonesian Rupiah currency formatter.
  static final NumberFormat rupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp. ',
    decimalDigits: 0,
  );

  /// Format amount as Indonesian Rupiah.
  static String format(double amount) => rupiah.format(amount);
}
