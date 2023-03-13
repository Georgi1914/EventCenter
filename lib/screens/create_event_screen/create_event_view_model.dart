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
        contentType: MediaType('multipart', 'form-data'),
      )
    });
    print(_binaryPickedImage.toString());
  }

  Future<void> createEvent() async {
    int myId = await _userRepo.getMeId();
    print(_binaryPickedImage);
    if (_binaryPickedImage != null) {
      final event = EventType(
        eventNameController.value.text,
        _selectedDateTime!,
        eventDescriptionController.value.text,
        eventAddressController.value.text,
        4,
        myId,
        {
          'name': '1920x1080p.jpg',
          'url': '/uploads/1920x1080p_0b1ab7a8ee.jpg',
        },
      );
      final response = await _eventRepo.createEvent(event);
    }
  }
}
