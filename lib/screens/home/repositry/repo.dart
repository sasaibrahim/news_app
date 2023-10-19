import 'package:http/http.dart';

abstract class BaseRepository {
  Future<Response> getSourses(String cat);

  Future<Response> getNewsData({String? keyword, String sourceId});
}
