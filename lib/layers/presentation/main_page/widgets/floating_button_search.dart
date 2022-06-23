import 'package:flutter/material.dart';
import 'package:weather_app/layers/presentation/common/hero_dialog_route.dart';
import 'package:weather_app/layers/presentation/search_page/search_city_by_name_page.dart';

class FloatingButtonSearch extends StatelessWidget {
  const FloatingButtonSearch({
    Key? key,
    required this.heroTag,
  }) : super(key: key);

  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              HeroDialogRoute(
                builder: (BuildContext context) => SearchCityByName(
                  heroTag: heroTag,
                ),
              ),
            );
          },
          child: Hero(
            tag: heroTag,
            child: Material(
              color: Theme.of(context).primaryColor,
              elevation: 24,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}