import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? data;
  var news_length;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse("https://inshorts.deta.dev/news?category="));
    if (response.statusCode == 200) {
      data = response.body; //store response as string
      setState(() {
        news_length = jsonDecode(data!)['data']; //get all the data from json string superheros// just printed length of data
      });
    }
  }

  bool darkTheme = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      //drawer: UserAccountsDrawerHeader(accountName: Text("Priyanshi Pandya"), )
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: const Text(
          "Bulletin Daily",
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
                  padding: const EdgeInsets.all(13.0),
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
