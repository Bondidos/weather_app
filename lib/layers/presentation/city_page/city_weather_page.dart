import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/weather_icons.dart';
import 'package:weather_app/generated/l10n.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/presentation/city_page/bloc/city_weather_cubit.dart';
import 'package:weather_app/injection_container.dart' as di;
import 'package:weather_app/layers/presentation/city_page/bloc/city_weather_state.dart';
import 'package:weather_app/layers/presentation/common/widgets/max_and_min_temperature.dart';
import 'package:weather_app/layers/presentation/common/widgets/date_widget.dart';
import 'package:weather_app/layers/presentation/common/widgets/description_widget.dart';
import 'package:weather_app/layers/presentation/common/widgets/current_temperature.dart';

class CityWeatherPage extends StatelessWidget {
  const CityWeatherPage({Key? key}) : super(key: key);
  static const String id = "city weather page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          S.current.CurrentWeather,
          style: const TextStyle().apply(color: Colors.white),
        ),
      ),
      body: BlocProvider<CityWeatherCubit>(
        create: (_) => di.inj<CityWeatherCubit>()..fetchCurrentWeather(),
        child: BlocConsumer<CityWeatherCubit, CityWeatherState>(
          listener: (context, state) {
            if (state is CityWeatherError) {
              _showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case CityWeatherStatus.initial:
                return const Center(child: CircularProgressIndicator());
              case CityWeatherStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case CityWeatherStatus.loaded:
                return buildBuildPage(context, state);
              case CityWeatherStatus.error:
                return buildError(context);
            }
          },
        ),
      ),
    );
  }

  RefreshIndicator buildBuildPage(
      BuildContext context, CityWeatherState state) {
    return RefreshIndicator(
      onRefresh: () => context.read<CityWeatherCubit>().fetchCurrentWeather(),
      child: buildCurrentWeather(state.currentWeather, context),
    );
  }

  Center buildError(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () => context.read<CityWeatherCubit>().fetchCurrentWeather(),
        icon: const Icon(
          Icons.refresh,
          size: 45,
          color: Colors.white,
        ),
      ),
    );
  }

  _showSnackBar(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget buildCurrentWeather(
    CurrentWeather? currentWeather,
    BuildContext context,
  ) {
    if (currentWeather == null) return Container();
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
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
      ),
    );
  }

  Padding buildCityName(String name, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(
        name,
        style: Theme.of(context).textTheme.displaySmall?.apply(
              color: Colors.white,
            ),
      ),
    );
  }
}
