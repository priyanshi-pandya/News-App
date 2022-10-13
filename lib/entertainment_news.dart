import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main_drawer.dart';

class EntertainmentNews extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ENews(),
    );
  }
}

class ENews extends StatefulWidget {
  @override
  EntertainmentNewsState createState() => EntertainmentNewsState();
}

class EntertainmentNewsState extends State<ENews> {
  String? data;
  var news_length;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse("https://inshorts.deta.dev/news?category=entertainment"));
    if (response.statusCode == 200) {
      data = response.body; //store response as string
      setState(() {
        news_length = jsonDecode(data!)['data']; //get all the data from json string superheros// just printed length of data
      }); //get all the data from json string superheros// just printed length of data
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      //drawer: UserAccountsDrawerHeader(accountName: Text("Priyanshi Pandya"), )
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: const Text(
          "Entertainment News",
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
        actions: [
          Icon(Icons.account_circle),
        ],
      ),
      drawer: MainDrawer(),

      body: ListView.builder(
        itemCount: news_length == null ? 0 : news_length.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.sports),
                  title: Text(
                    jsonDecode(data!)['data'][index]['title'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(jsonDecode(data!)['data'][index]['content'], style: TextStyle(fontSize: 16)),
                ),
                Image.network(jsonDecode(data!)['data'][index]['imageUrl'], fit: BoxFit.fill, height: 300, width: double.infinity, alignment: Alignment.center),
                SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }
}
