import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/home/cubit/states.dart';
import 'package:news_app/screens/home/repositry/repo.dart';

import '../../../models/NewsResponse.dart';
import '../../../models/SoursesResponse.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.baseRepository) : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);
  BaseRepository baseRepository;
  List<Sources> sources = [];
  List<Articles> news = [];
  int selectedIndex = 0;

  void changeSources(int index) {
    selectedIndex = index;
    emit(HomeChangeSourcesState());
  }

  Future<void> getSourses(String cat) async {
    emit(HomeGetSourcesLoadingState());
    baseRepository.getSourses(cat).then((value) {
      var jsonResponse = jsonDecode(value.body);
      SoursesResponse soursesResponse = SoursesResponse.fromJson(jsonResponse);
      if (soursesResponse.status != 'ok') {
        emit(HomeGetConnectionErrorState());
        return;
      }

      sources = soursesResponse.sources ?? [];
      emit(HomeGetSourcesSuccessState());
    }).catchError((error) {
      emit(HomeGetSourcesErrorState(error));
    });
  }

  Future<void> getNewsData({String? keyword}) async {
    emit(HomeGetNewsLoadingState());
    baseRepository
        .getNewsData(sourceId: sources[selectedIndex].id ?? "")
        .then((value) {
      var jsonResponse = jsonDecode(value.body);
      NewsResponse newsResponse = NewsResponse.fromJson(jsonResponse);
      if (newsResponse.status != 'ok') {
        emit(HomeGetConnectionErrorState());
        return;
      }
      news = newsResponse.articles ?? [];
      emit(HomeGetNewsSuccessState());
    }).catchError((error) {
      emit(HomeGetNewsErrorState(error));
    });
  }
}
