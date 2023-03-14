import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../data/repositories/events/event.dart';
import '../../data/repositories/user/user.dart';
import '../../models/ui/event_type.dart';

class CreateEventVM extends ChangeNotifier {
  final eventNameController = TextEditingController();
  final eventAddressController = TextEditingController();
  final eventDescriptionController = TextEditingController();
  final EventRepo _eventRepo;
  final UserRepo _userRepo;
  DateTime? pickedDate;
  TimeOfDay? pickedTime;
  DateTime? _selectedDateTime;
  FormData? _binaryPickedImage;

  CreateEventVM({required EventRepo eventRepo, required UserRepo userRepo})
      : _eventRepo = eventRepo,
        _userRepo = userRepo;

  void setPickedDate() {
    if (pickedDate != null && pickedTime != null) {
      _selectedDateTime = DateTime(
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
    if (_selectedDateTime != null) {
      return DateFormat('EEE, MMM d, yyyy, hh:mm a').format(_selectedDateTime!);
    }
    return null;
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      await setBinaryPickedImage(File(pickedFile.path));
    }
  }

  Future<void> setBinaryPickedImage(File file) async {
    print(file.path);

    _binaryPickedImage = FormData.fromMap({
      'fileInfo': {
        'name': file.uri.pathSegments.last,
        'folder': '1',
      },
      'files': await MultipartFile.fromFile(
        file.path,
        filename: file.uri.pathSegments.last,
        contentType: MediaType('image', 'jpeg'),
      )
    });
  }

  Future<void> createEvent() async {
    final selectedDate = _selectedDateTime;
    final _pickedImage = _binaryPickedImage;
    final int myId = await _userRepo.getMeId();
    if (_pickedImage != null && selectedDate != null) {
      final response = await _eventRepo.createEvent(
        EventType(
          eventNameController.value.text,
          selectedDate,
          eventDescriptionController.value.text,
          eventAddressController.value.text,
          4,
          myId,
          4, //todo take the id from the upload request
        ),
        _pickedImage,
      );
    }
  }

  @override
  void dispose() {
    eventNameController.dispose();
    eventAddressController.dispose();
    eventDescriptionController.dispose();
    super.dispose();
  }
}
