import 'package:flutter_dotenv/flutter_dotenv.dart';

final baseURL = dotenv.env['BASE_URL']!;
final List<String> imageUrls = [
  'https://eu-bloger.eu/images/easyblog_images/399/1920x1080p.jpg',
  'https://images.pexels.com/photos/2263436/pexels-photo-2263436.jpeg?cs=srgb&dl=pexels-teddy-yang-2263436.jpg&fm=jpg',
  'https://www.shutterstock.com/image-photo/crowd-concert-summer-music-festival-260nw-611045375.jpg',
  'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg',
  'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg'
];
