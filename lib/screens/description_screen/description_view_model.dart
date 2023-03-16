import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DescriptionVM extends ChangeNotifier {
  String formattedDate(DateTime date) =>
      '${DateFormat('yMMMMEEEEd').format(date)} ${DateFormat('Hm').format(date)}';
}
