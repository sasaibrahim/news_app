import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/home/cubit/cubit.dart';
import 'package:news_app/screens/home/cubit/states.dart';
import 'package:news_app/screens/home/repositry/dto/locale.dart';
import 'package:news_app/screens/home/repositry/dto/remote.dart';
import 'package:news_app/screens/tabs_screen.dart';

import '../../models/category_model.dart';

class NewsScreen extends StatelessWidget {
  //////ex////
  CategoryModel categoryModel;

  NewsScreen(this.categoryModel);

  var connect = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(connect ? RemotRepo() : LocaleRepo())
        ..getSourses(categoryModel.id),
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
    // return  FutureBuilder(           ////ex/////
    //   future: ApiManager.getSourses(categoryModel.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //     if (snapshot.hasError) {
    //       return Column(
    //         children: [
    //           Text("something error"),
    //           TextButton(onPressed: () {}, child: Text("try again"))
    //         ],
    //       );
    //     }
    //     if (snapshot.data?.status != "ok") {
    //       return Column(
    //         children: [
    //           Text(" error"),
    //           TextButton(onPressed: () {}, child: Text("try again"))
    //         ],
    //       );
    //     }
    //     var sourses = snapshot.data!.sources ?? [];
    //     return TapsScreen(sourses);
    //   },
    // );
  }
}
