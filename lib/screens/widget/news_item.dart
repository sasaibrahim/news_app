import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsResponse.dart';

import '../../models/category_model.dart';
import '../detail_articale.dart';

class NewsItems extends StatelessWidget {
  Articles article;

  NewsItems(this.article);

  var categorie = CategoryModel.getCategories();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(DetailArticales.routeName, arguments: article),
      child: Card(
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
            ],
          ),
        ),
      ),
    );
  }
}
