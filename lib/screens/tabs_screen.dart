import 'package:flutter/material.dart';
import 'package:news_app/screens/home/cubit/cubit.dart';
import 'package:news_app/screens/widget/news_item.dart';
import 'package:news_app/screens/widget/sourse_item.dart';

import '../models/SoursesResponse.dart';

class TapsScreen extends StatelessWidget {
  List<Sources> sourses;

  TapsScreen(this.sourses);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: sourses.length,
            child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.transparent,
                onTap: (value) {
                  HomeCubit.get(context).changeSources(value);
                },
                tabs: sourses.map((source) {
                  return Tab(
                    child: SourseItem(
                        source,
                        sourses.indexOf(source) ==
                            HomeCubit.get(context).selectedIndex),
                  );
                }).toList())),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return NewsItems(
                HomeCubit.get(context).news[index],
              );
            },
            itemCount: HomeCubit.get(context).news.length,
          ),
        ),

        // FutureBuilder(
        //   future: ApiManager.getNewsData(sourceId:widget.sourses[selectedIndex].id??"",
        //       ),
        //     builder: (context,snapshot){
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return Center(child: CircularProgressIndicator());
        //       }
        //       if (snapshot.hasError) {
        //         return Column(
        //           children: [
        //             Text("something error"),
        //             TextButton(onPressed: () {}, child: Text("try again"))
        //           ],
        //         );
        //       }
        //       if (snapshot.data?.status != "ok") {
        //         return Column(
        //           children: [
        //             Text(" error"),
        //             TextButton(onPressed: () {}, child: Text("try again"))
        //           ],
        //         );
        //       }
        //       var newsData=snapshot.data?.articles??[];
        //       return Expanded(
        //         child: ListView.builder(itemBuilder: (context,index){
        //           return NewsItems(newsData[index],);
        //         },
        //         itemCount: newsData.length,),
        //       );
        //     }),
      ],
    );
  }
}
