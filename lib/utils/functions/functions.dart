import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

String formatMoneyMXM(int amount) => "${NumberFormat.currency(locale: 'es_MX', symbol: '\$').format(amount)} MXN";

String bathroomsToString(double value) {
  if (value == value.toInt()) {
    return value.toInt().toString();
  }

  return value.toString();
}

String getTimeAgo(DateTime date) {
  return Jiffy.parseFromDateTime(date).fromNow();
}
