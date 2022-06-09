import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/presentation/city_page/bloc/city_weather_cubit.dart';
import 'package:weather_app/injection_container.dart' as di;
import 'package:weather_app/layers/presentation/city_page/bloc/city_weather_state.dart';

class CityWeatherPage extends StatelessWidget {
  const CityWeatherPage({Key? key}) : super(key: key);
  static const String id = "city weather page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current weather in city"),
      ),
      body: BlocProvider<CityWeatherCubit>(
        create: (_) => di.inj<CityWeatherCubit>()..fetchWeather(),
        child: BlocConsumer<CityWeatherCubit,CityWeatherState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
            children: [
              Text(state.currentWeather?.name ?? ""),
              Text(state.currentWeather?.temp.toString() ?? ""),
              Text(state.currentWeather?.weather.description ?? ""),
            ],
          );
          },
        ),
      ),
    );
  }
}
