import 'package:flutter/material.dart';

const searchCityPageRatio = 3 / 4;

class SearchCityByName extends StatelessWidget {
  const SearchCityByName({Key? key, required this.heroTag}) : super(key: key);
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        height: size.height * searchCityPageRatio,
        width: size.width * searchCityPageRatio,
        child: Hero(
          tag: heroTag,
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildSearchFieldAndList(),
            ),
          ),
        ),
      ),
    );
  }

  Column buildSearchFieldAndList() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(child: buildSearchField()),
        // Expanded(child: buildSearchList())
      ],
    );
  }

  TextField buildSearchField() {
    return const TextField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        fillColor: Colors.white24,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        filled: true,
        hintStyle: TextStyle(color: Colors.white30),
        hintText: 'Search city',
      ),
      onChanged: null,
    );
  }

  ListView buildSearchList() {
    return ListView.builder(
        itemCount: 0,
        itemBuilder: (context, index) => Container()
    );
  }
}
