import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/injection_container.dart' as di;
import 'package:weather_app/layers/presentation/search_page/bloc/search_user_state.dart';
import 'bloc/search_city_cubit.dart';

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
              child: BlocProvider<SearchCityCubit>(
                create: (_) => di.inj<SearchCityCubit>()..init(),
                child: BlocConsumer<SearchCityCubit, SearchCityState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    SearchCityCubit cubit = context.read<SearchCityCubit>();
                    return buildSearchFieldAndList(state,cubit);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column buildSearchFieldAndList(SearchCityState state, SearchCityCubit cubit) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(child: buildSearchField(cubit)),
        Expanded(child: buildSearchList(state))
      ],
    );
  }

  TextField buildSearchField(SearchCityCubit cubit) {
    return TextField(
      cursorColor: Colors.black,
      decoration: const InputDecoration(
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
      onChanged: (search) => cubit.onTextChange(search),
    );
  }

  ListView buildSearchList(SearchCityState state) {
    return ListView.builder(
        itemCount: state.foundList.length,
        itemBuilder: (context, index) {
          SearchCityCubit cubit = context.read<SearchCityCubit>();
          return ListTile(
            onTap: () async {
              await cubit.cityPicked(index);
              //todo navigate to city detailPage
            },
            title: Text(state.foundList[index].name),
            subtitle: Text(state.foundList[index].country),
          );
        });
  }
}
