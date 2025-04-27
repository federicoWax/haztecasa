import 'package:intl/intl.dart';

String formatMoneyMXM(int amount) => "${NumberFormat.currency(locale: 'es_MX', symbol: '\$').format(amount)} MXN";

String bathroomsToString(double value) {
  if (value == value.toInt()) {
    return value.toInt().toString();
  }

  return value.toString();
}
