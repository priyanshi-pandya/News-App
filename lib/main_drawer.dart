import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'national_news.dart';
import 'sports_news.dart';
import 'science_news.dart';
import 'entertainment_news.dart';
import 'politics_news.dart';
import 'world_news.dart';
import 'business_news.dart';

bool darkTheme = false;

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // ignore: dead_code
    return Drawer(
      backgroundColor: Colors.grey[400],
      elevation: 10,
      child: Column(
        children: [
          //Icons.dark_mode,
          SizedBox(
            height: 70,
            child: DrawerHeader(
              child: Text(
                "Categories",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
          ),

          // SwitchListTile(
          //     title: Text("Dark Mode"),
          //     value: darkTheme,
          //     onChanged: (bool value) {
          //       WidgetsBinding.instance?.addPostFrameCallback((_)
          //        {
          //         darkTheme = value;
          //       });
          //     }),

          ListTile(
            title: new Text("national"),
            leading: Icon(Icons.maps_home_work),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NationalNews()));
            },
          ),
          ListTile(
            title: new Text("business"),
            leading: Icon(Icons.business),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BusinessNews()));
            },
          ),
          ListTile(
              title: new Text("sports"),
              leading: Icon(Icons.sports_soccer),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SportsNews()));
              }),
          ListTile(
              title: new Text("world"),
              leading: Icon(Icons.explore),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => WorldNews()));
              }),
          ListTile(
              title: new Text("politics"),
              leading: Icon(Icons.policy),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticsNews()));
              }),
          ListTile(
              title: new Text("entertainment"),
              leading: Icon(Icons.deck),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EntertainmentNews()));
              }),
          ListTile(
              title: new Text("science"),
              leading: Icon(Icons.science),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ScienceNews()));
              }),
          Divider(
            height: 0.1,
          )
        ],
      ),
    );
  }
}
