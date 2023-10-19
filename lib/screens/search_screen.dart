import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/tabs_screen.dart';

import 'home/cubit/cubit.dart';
import 'home/cubit/states.dart';

class SearchScreen extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: Icon(
          Icons.search,
          size: 30,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_back,
        size: 30,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return BlocProvider(
      create: (context) => HomeCubit()..getNewsData(keyword: query),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeGetSourcesLoadingState ||
              state is HomeGetNewsLoadingState) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                    title: Center(child: CircularProgressIndicator()),
                  );
                });
          } else if (state is HomeGetSourcesSuccessState) {
            HomeCubit.get(context).getNewsData();
          } else if (state is HomeGetSourcesErrorState) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text(state.error),
                    ));
          } else if (state is HomeGetNewsSuccessState) {
            Navigator.pop(context);
          } else if (state is HomeChangeSourcesState) {
            HomeCubit.get(context).getNewsData();
          } else if (state is HomeGetNewsErrorState) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text(state.error),
                    ));
          }
        },
        builder: (context, state) {
          return TapsScreen(HomeCubit.get(context).sources);
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if (query.isEmpty) {
      return Center(child: Text('suggestion'));
    } else {
      return BlocProvider(
        create: (context) => HomeCubit()..getNewsData(keyword: query),
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {
            if (state is HomeGetSourcesLoadingState ||
                state is HomeGetNewsLoadingState) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.transparent,
                      title: Center(child: CircularProgressIndicator()),
                    );
                  });
            } else if (state is HomeGetSourcesSuccessState) {
              HomeCubit.get(context).getNewsData();
            } else if (state is HomeGetSourcesErrorState) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content: Text(state.error),
                      ));
            } else if (state is HomeGetNewsSuccessState) {
              Navigator.pop(context);
            } else if (state is HomeChangeSourcesState) {
              HomeCubit.get(context).getNewsData();
            } else if (state is HomeGetNewsErrorState) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content: Text(state.error),
                      ));
            }
          },
          builder: (context, state) {
            return TapsScreen(HomeCubit.get(context).sources);
          },
        ),
      );
    }
  }
}
