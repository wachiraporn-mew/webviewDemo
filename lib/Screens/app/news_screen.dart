import 'dart:convert';

import 'package:webviewDemo/news_view.dart';
import 'package:flutter/material.dart';
import 'package:webviewDemo/drawer_menu.dart';
import 'package:http/http.dart' as Http;
import '../Login/components/background.dart';
import 'package:webviewDemo/profile.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var jsonData;
  List<ThailandNewsData> dataList = [];

  Future<String> _GetNewsAPI() async {
    var response = await Http.get('http://newsapi.org/v2/top-headlines?country=th&category=business&apiKey=7428f03ff2ce4c7b97403342a99bb69c');
    
  jsonData = json.decode(utf8.decode(response.bodyBytes));  
  for (var data in jsonData['articles']) {
    ThailandNewsData news = ThailandNewsData(
      data['title'], data['description'], data['urlToImage'], data['url']);
    dataList.add(news);
  }  

    return 'OK';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thailand News'),
      ),
      drawer: DrawerMenu(),
      body: Background(
        child: FutureBuilder(
          future: _GetNewsAPI(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: <Widget>[
            Card(
              child: Image.network(
                '${dataList[index].urlToImage}'),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
                margin: EdgeInsets.all(15),
              ),
          InkWell(
            child: Container(
              margin: EdgeInsets.all(15),
              child: Align(
                child: Text(
                  '${dataList[index].title}'
                  , style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onTap: (){
                Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => NewsViewPage(url: dataList[index].url,
                  )));
              }
          ),
             Container(
               margin: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              child: Align(
                child: Text(
                  '${dataList[index].description}',
                  style: TextStyle(
                  color: Colors.grey[600])
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
          ],
                    ),
                  );
                },
        );
            } else {
              return Container(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class ThailandNewsData {
  String title;
  String description;
  String urlToImage;
  String url;
  ThailandNewsData (this.title, this.description, this.urlToImage, this.url);
}
