import 'package:weather_app/common/constants.dart';

class WeatherIcons {

  static const _icons = {
    '01d': 'assets/weather_icons/01d@2x.png',
    '01n': 'assets/weather_icons/01n@2x.png',
    '02d': 'assets/weather_icons/02d@2x.png',
    '02n': 'assets/weather_icons/02n@2x.png',
    '03d': 'assets/weather_icons/03d@2x.png',
    '03n': 'assets/weather_icons/03n@2x.png',
    '04d': 'assets/weather_icons/04d@2x.png',
    '04n': 'assets/weather_icons/04n@2x.png',
    '09d': 'assets/weather_icons/09d@2x.png',
    '09n': 'assets/weather_icons/09n@2x.png',
    '10d': 'assets/weather_icons/10d@2x.png',
    '10n': 'assets/weather_icons/10n@2x.png',
    '11d': 'assets/weather_icons/11d@2x.png',
    '11n': 'assets/weather_icons/11n@2x.png',
    '13d': 'assets/weather_icons/13d@2x.png',
    '13n': 'assets/weather_icons/13n@2x.png',
    '50d': 'assets/weather_icons/50d@2x.png',
    '50n': 'assets/weather_icons/50n@2x.png',
  };

  static String getIconLink(String id) => _icons[id] ?? notPicked;
}
