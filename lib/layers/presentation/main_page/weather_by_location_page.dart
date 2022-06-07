import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/layers/domain/models/weather_current_with_forecast/weather_cuurent_with_forecast.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/daily_forecast.dart';
import 'package:weather_app/layers/domain/models/weather_forecast/hourly_forecast.dart';
import 'package:weather_app/layers/presentation/main_page/bloc/main_page_cubit.dart';
import 'package:weather_app/layers/presentation/main_page/bloc/main_page_state.dart';
import 'package:weather_app/layers/presentation/main_page/widgets/daily_weather_forecast.dart';
import 'package:weather_app/layers/presentation/main_page/widgets/floatingButtonSearch.dart';
import 'package:weather_app/injection_container.dart' as di;
import 'package:weather_app/layers/presentation/main_page/widgets/hourlyWeatherItem.dart';
import 'package:weather_app/layers/presentation/main_page/widgets/weatherSliverAppBarWidget.dart';

class WeatherByLocationPage extends StatelessWidget {
  const WeatherByLocationPage({Key? key}) : super(key: key);

  static const String id = "WeatherByLocation";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<MainPageCubit>(
          create: (context) => di.inj<MainPageCubit>()..fetchWeather(),
          child: BlocConsumer<MainPageCubit, MainPageState>(
            listener: (context, state) {
              if (state is MainPageError) _showSnackBar(context, state.message);
            },
            builder: (context, state) {
              switch (state.status) {
                case MainPageStatus.loaded:
                  if (state.weatherCurrentWithForecast == null) {
                    return Container();
                  }
                  return RefreshIndicator(
                    onRefresh: () =>
                        context.read<MainPageCubit>().fetchWeather(),
                    child: Stack(
                      children: [

                        buildWeatherPage(
                          state.weatherCurrentWithForecast!,
                        ),
                        const FloatingButtonSearch(heroTag: id),
                      ],
                    ),
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

  CustomScrollView buildWeatherPage(
    WeatherCurrentWithForecast weatherCurrentWithForecast,
  ) {
    List<HourlyForecast> hourlyForecast =
        weatherCurrentWithForecast.hourlyForecast;
    List<DailyForecast> dailyForecast =
        weatherCurrentWithForecast.dailyForecast;

    return CustomScrollView(
      slivers: [
        WeatherSliverAppBar(
          currentWeather: weatherCurrentWithForecast.currentWeather,
        ),
        buildHourlyWeatherForecastCarousel(hourlyForecast),
        buildDailyForecastList(dailyForecast),
      ],
    );
  }

  SliverList buildDailyForecastList(List<DailyForecast> dailyForecast) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => DailyWeatherForecast(
          dailyForecast: dailyForecast[index],
        ),
        childCount: dailyForecast.length,
      ),
    );
  }

  SliverToBoxAdapter buildHourlyWeatherForecastCarousel(
      List<HourlyForecast> hourlyForecast) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 175, // todo use screen sizes for display adaptations
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hourlyForecast.length,
          itemBuilder: (context, index) {
            return HourlyWeatherItem(hourlyForecast: hourlyForecast[index]);
          },
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
}
