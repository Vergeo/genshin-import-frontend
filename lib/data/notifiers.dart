import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

ValueNotifier<int> selectedPage = ValueNotifier(0);
ValueNotifier<int> darkMode = ValueNotifier(0);

ValueNotifier<NumberFormat> currencyNotifier = ValueNotifier(
  NumberFormat.currency(locale: "id_ID", decimalDigits: 0, symbol: "Rp "),
);
