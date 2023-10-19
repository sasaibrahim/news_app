import 'package:http/http.dart';
import 'package:news_app/screens/home/repositry/repo.dart';

class LocaleRepo extends BaseRepository {
  @override
  Future<Response> getNewsData({String? keyword, String? sourceId}) {
    // TODO: implement getNewsData
    throw UnimplementedError();
  }

  @override
  Future<Response> getSourses(String cat) {
    // TODO: implement getSourses
    throw UnimplementedError();
  }
}
