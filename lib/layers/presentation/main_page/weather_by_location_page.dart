import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/layers/domain/models/current_weather/current_weather.dart';
import 'package:weather_app/layers/presentation/main_page/bloc/main_page_cubit.dart';
import 'package:weather_app/layers/presentation/main_page/bloc/main_page_state.dart';
import 'package:weather_app/layers/presentation/main_page/widgets/floatingButtonSearch.dart';
import 'package:weather_app/injection_container.dart' as di;

class WeatherByLocationPage extends StatelessWidget {
  const WeatherByLocationPage({Key? key}) : super(key: key);

  static const String id = "WeatherByLocation";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<MainPageCubit>(
          create: (context) => di.inj<MainPageCubit>()..init(),
          child: BlocConsumer<MainPageCubit, MainPageState>(
            listener: (context, state) {
              if (state is MainPageError) _showSnackBar(context, state.message);
            },
            builder: (context, state) {
              switch (state.status) {
                case MainPageStatus.loaded:
                  if (state.currentWeather == null) return Container();
                  return Stack(
                    children: [
                      const FloatingButtonSearch(heroTag: id),
                      buildWeatherPage(state.currentWeather!),
                    ],
                  );

                case MainPageStatus.initial:
                  // TODO: Handle this case.
                  break;
                case MainPageStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case MainPageStatus.error:
                  // TODO: Handle this case.
                  break;
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
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

  CustomScrollView buildWeatherPage(CurrentWeather currentWeather) => CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: buildTitle(currentWeather.name),
              background: CurrentWeatherWidget(
                maxMinTemp: "${currentWeather.main.tempMax}/${currentWeather.main.tempMin}",
                description: currentWeather.weather.first.description,
                currentTemp: currentWeather.main.temp.toString(),
              ),
            ),
          )
        ],
      );

  Align buildTitle(String cityName) {
    return Align(alignment: Alignment.center, child: Text(cityName));
  }

  Row buildWeatherIconAndDate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text("Weather Icon"),
        Text("Date Widget"),
      ],
    );
  }
}

class CurrentWeatherWidget extends StatelessWidget {
  final String currentTemp;
  final String maxMinTemp;
  final String description;

  const CurrentWeatherWidget({
    Key? key,
    required this.maxMinTemp,
    required this.currentTemp,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(currentTemp),
        Text(maxMinTemp),
        Text(description),
      ]),
    );
  }
}
