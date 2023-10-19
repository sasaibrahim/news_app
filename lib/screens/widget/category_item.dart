import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  int index;

  CategoryItem(this.categoryModel, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomRight: index.isOdd ? Radius.circular(30) : Radius.zero,
            bottomLeft: index.isEven ? Radius.circular(30) : Radius.zero),
        color: categoryModel.color,
      ),
      child: Column(
        children: [
          Image.asset(
            categoryModel.image,
            height: 120,
          ),
          Expanded(
              child: Center(
                  child: Text(
            categoryModel.name,
            style: GoogleFonts.amiri(fontSize: 20, fontWeight: FontWeight.bold),
          ))),
        ],
      ),
    );
  }
}
