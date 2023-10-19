import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/categories_screen.dart';
import 'package:news_app/screens/home/news_screen.dart';
import 'package:news_app/screens/widget/drawer_widget.dart';

//import '../models/news_model.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  List<CategoryModel> results = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerWidget(ondrawerclick),
        appBar: AppBar(
          actions: [
            // IconButton(onPressed: ()=>showSearch(context: context, delegate:SearchScreen() )
            // ,
            //    icon: Icon(Icons.search,size: 30,),

            // )
//
          ],
          centerTitle: true,
          elevation: 0,
          shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
          ),
          backgroundColor: Color(0xFF39A552),
          title: Text(categoryModel == null ? "News App" : categoryModel!.name),
        ),
//////ex/////
        body: categoryModel == null
            ? CategoryScreen(onCategorySelected)
            : NewsScreen(categoryModel!));
  }

  /////ex/////
  CategoryModel? categoryModel = null;

  void onCategorySelected(category) {
    categoryModel = category;
    setState(() {});
  }

  void ondrawerclick(num) {
    if (num == DrawerWidget.CAREGORY) {
      //open category screen
      categoryModel = null;
    } else if (num == DrawerWidget.SETTING) {
      //open setting screen
    } else if (num == DrawerWidget.FAVOURITE) {
      // Navigator.pushNamed(context, routeName)
    }
    setState(() {
      Navigator.pop(context);
    });
  }
}
