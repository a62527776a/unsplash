import 'package:flutter/material.dart';
import 'package:unsplash/service/core.dart';
import 'package:unsplash/model/model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: FeedList(),
    );
  }
}

class FeedList extends StatefulWidget {
  FeedList({Key key}) : super(key: key);



  @override
  _FeedListState createState(){
    return _FeedListState();
  }
}

class _FeedListState extends State<FeedList> {
  List<ImageModal> _feedList = [];

  Future FindFeedList () async {
    var response = await api['getFeedList']({
      'page': '3',
      'per_page': '2'
    });
    setState(() {
      _feedList.addAll(response.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    FindFeedList();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text('unSplash')
      ),
      body: new Container(
        padding: const EdgeInsets.only(top: 8.0, left: 12.0, right: 12.0, bottom: 8.0),
        child: ListView.builder(itemBuilder: (BuildContext context, int index) {
          print(_feedList[index] is ImageModal);
          return _feedList.length == 0 ? null : ImageCard(_feedList[index].urls.raw);
        })
//          return ImageCard('http://img.rr.tv/medal/20181224/o_1545631459296.png?imageslim')),
      )
    );
  }
}

class ImageCard extends StatelessWidget {
  ImageCard(this.imageThumb);
  String imageThumb;

  @override
  Widget build(BuildContext context) {
    return new Image.network(imageThumb, width: 50.0, height: 50.0);
  }
}
