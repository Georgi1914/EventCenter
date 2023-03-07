import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateEventVM extends ChangeNotifier {
  final eventNameController = TextEditingController();
  final eventAddressController = TextEditingController();
  final eventDescriptionController = TextEditingController();
  DateTime? pickedDate;
  TimeOfDay? pickedTime;
  DateTime? selectedDateTime;

  void setPickedDate() {
    if (pickedDate != null && pickedTime != null) {
      selectedDateTime = DateTime(
        pickedDate!.year,
        pickedDate!.month,
        pickedDate!.day,
        pickedTime!.hour,
        pickedTime!.minute,
      );
      notifyListeners();
    }
  }

  String? getTimeAsString() {
    if (selectedDateTime != null) {
      return DateFormat('EEE, MMM d, yyyy, hh:mm a').format(selectedDateTime!);
    }
    return null;
  }
}
