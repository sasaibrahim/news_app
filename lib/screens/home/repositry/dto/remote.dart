import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/screens/home/repositry/repo.dart';

class RemotRepo extends BaseRepository {
  @override
  Future<Response> getNewsData({String? keyword, String? sourceId}) {
    // TODO: implement getNewsData
    Uri URL = Uri.https("newsapi.org", "/v2/everything", {
      "apiKey": "fa504bcbd0354683a053d3119e93be13",
      "sources": sourceId,
      "q": keyword
    });
    return http.get(URL);
  }

  @override
  Future<Response> getSourses(String cat) {
    // TODO: implement getSourses
    Uri URL = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "fa504bcbd0354683a053d3119e93be13", "category": cat});
    return http.get(URL);
  }
}
