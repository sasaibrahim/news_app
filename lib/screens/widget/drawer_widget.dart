import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  Function onDrawerselect;

  DrawerWidget(this.onDrawerselect);

  static int CAREGORY = 1;
  static int SETTING = 2;
  static int FAVOURITE = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            color: Color(0xFF39A552),
            child: Center(
              child: Text(
                'NewsApp!',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onDrawerselect(CAREGORY);
            },
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  size: 30,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "Category",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 3,
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              onDrawerselect(SETTING);
            },
            child: Row(
              children: [
                Icon(Icons.settings, size: 30, color: Colors.black),
                Text("Settings",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              onDrawerselect(FAVOURITE);
            },
            child: Row(
              children: [
                Icon(Icons.favorite, size: 30, color: Colors.black),
                Text("Favourite",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
