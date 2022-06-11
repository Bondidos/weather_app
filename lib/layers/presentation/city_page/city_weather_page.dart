import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/weather_icons.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/presentation/city_page/bloc/city_weather_cubit.dart';
import 'package:weather_app/injection_container.dart' as di;
import 'package:weather_app/layers/presentation/city_page/bloc/city_weather_state.dart';
import 'package:weather_app/layers/presentation/common/widgets/current_weather_common_widgets.dart';
import 'package:weather_app/layers/presentation/main_page/widgets/date_widget.dart';
import 'package:weather_app/layers/presentation/main_page/widgets/description_widget.dart';
import 'package:weather_app/layers/presentation/main_page/widgets/max_and_min_temperature.dart';

class CityWeatherPage extends StatelessWidget {
  const CityWeatherPage({Key? key}) : super(key: key);
  static const String id = "city weather page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.CurrentWeather),
      ),
      body: BlocProvider<CityWeatherCubit>(
        create: (_) => di.inj<CityWeatherCubit>()..fetchWeather(),
        child: BlocConsumer<CityWeatherCubit, CityWeatherState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.status == CityWeatherStatus.loaded) {
              return buildCurrentWeather(state.currentWeather, context);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget buildCurrentWeather(
      CurrentWeather? currentWeather, BuildContext context) {
    if (currentWeather == null) return Container();
    return Center(
      child: Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCityName(currentWeather.name, context),
            CurrentTemperature(
              temp: currentWeather.temp,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Image.asset(
                WeatherIcons.getIconLink(currentWeather.weather.icon),
              ),
            ),
            MaxAndMinTemperature(
              tempMax: currentWeather.tempMax,
              tempMin: currentWeather.tempMin,
            ),
            Description(description: currentWeather.weather.description),
            DateWidget(timeStamp: currentWeather.timeStamp),
          ],
        ),
      ),
    );
  }

  Padding buildCityName(String name, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(name, style: Theme.of(context).textTheme.displaySmall),
    );
  }
}
