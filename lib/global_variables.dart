import 'package:flutter_dotenv/flutter_dotenv.dart';

final baseURL = dotenv.env['BASE_URL']!;

enum PageEnum { home, favorites, profile }
