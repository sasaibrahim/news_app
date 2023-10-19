import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/NewsResponse.dart';

class DetailArticales extends StatelessWidget {
  static const String routeName = "details";

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(22),
            bottomRight: Radius.circular(22),
          ),
        ),
        backgroundColor: Color(0xFF39A552),
      ),
      body: Card(
        margin: EdgeInsets.all(8),
        elevation: 16,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.transparent)),
        child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? "",
                  height: 160,
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Text(
                article.title ?? "",
                style: TextStyle(fontSize: 16, color: Color(0xff7077070)),
                maxLines: 2,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                article.description ?? "",
                style: TextStyle(fontSize: 13, color: Colors.black45),
              ),
              Text(
                article.author ?? "",
                style: TextStyle(fontSize: 8, color: Colors.black),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                article.publishedAt?.substring(0, 10) ?? "",
                style: TextStyle(fontSize: 13, color: Colors.black45),
                textAlign: TextAlign.end,
              ),
              SizedBox(
                height: 3,
              ),
              Text(article.description ?? ''),
              SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => launchUrl(article.url),
                    child: Text("view all category",
                        style: TextStyle(fontSize: 13, color: Colors.black45)),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.black),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  launchUrl(String? url) {}
}
