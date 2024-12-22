import 'package:intl/intl.dart';

extension DateExt on DateTime {
  String get getDisplayDate => DateFormat('dd-MM-yyyy').format(this);

  String get ddMMyyyy => DateFormat('dd MMM,yyyy').format(this);

  String get toApiFormat => DateFormat('yyyy-MM-dd').format(this);
}

extension StrExt on String {
  int get toInt {
    try {
      var value = int.tryParse(this);
      return value!;
    } on Exception catch (e) {}
    return -1;
  }

  num get toNum {
    try {
      var value = num.tryParse(this);
      return value!;
    } on Exception catch (e) {}
    return -1;
  }


}

extension NumExt on num {
  String get toMoney {
    NumberFormat numberFormat =
        NumberFormat.currency(locale: 'en_IN', symbol: '₹');
    numberFormat.maximumFractionDigits = 2;
    numberFormat.minimumFractionDigits = 0;

    return numberFormat.format(this);
  }

  String get formatZero {
    NumberFormat numberFormat = NumberFormat.compact();
    numberFormat.maximumFractionDigits = 2;
    numberFormat.minimumFractionDigits = 0;

    return numberFormat.format(this);
  }
}
