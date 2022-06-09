import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/weather_icons.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/presentation/city_page/bloc/city_weather_cubit.dart';
import 'package:weather_app/injection_container.dart' as di;
import 'package:weather_app/layers/presentation/city_page/bloc/city_weather_state.dart';
import 'package:weather_app/layers/presentation/common/widgets/current_weather_common_widgets.dart';

class CityWeatherPage extends StatelessWidget {
  const CityWeatherPage({Key? key}) : super(key: key);
  static const String id = "city weather page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Current weather"),
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
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CityName(
              name: currentWeather.name,
            ),
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
            CurrentDate(timeStamp: currentWeather.timeStamp),
          ],
        ),
      ),
    );
  }
}

class CityName extends StatelessWidget {
  final String name;

  const CityName({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(name, style: Theme.of(context).textTheme.displaySmall),
    );
  }
}
