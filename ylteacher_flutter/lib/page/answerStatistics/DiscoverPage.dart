import 'dart:async';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/DiscoverItemModel.dart';


//class AnswerStatisticsPage extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return  MaterialApp(
//
//        theme: new ThemeData(
//            primaryColor: Colors.white
//        ),
//        home: DiscoverPageState()
//    );
//  }
//
//}
class AnswerStatisticsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    // TODO: implement createState
    return AnswerStatisticsState();
  }
}

class AnswerStatisticsState extends State<AnswerStatisticsPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("pageinitState----------");
    print(window.defaultRouteName);
  }
  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();

  }

  void _onEvent(Object event) {
    print(event.toString());
  }
  // 错误返回
  void _onError(Object error) {
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: new CupertinoNavigationBar(
            middle: Text("答疑统计",style: TextStyle(fontSize: 20),),
            backgroundColor:Colors.white
        ),
        body:  new Container(

            color: Color(0xfff5f5f5),
            child: new ListView.builder(
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return Text("llllll");
                })
        )
    );

  }
}

class TempTopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
    child:  new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Image.asset('images/discover/discover_topnotice.png',
                fit: BoxFit.fill),
          ],
        )
    );
  }
}
class DiscoverTopView extends StatelessWidget {

  final Function topTap;
  final List topList;
  const DiscoverTopView({
    Key key,
    this.topList,
    this.topTap
  }) : super(key: key);

  topItemWidget(){
    List<Widget> listWidgets = [];
    for (var item in topList){
      listWidgets.add(
        new Text(
          item["NewsTitle"],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: new TextStyle(
            height: 1.1,
            color: Color(0xFF333333),
            fontSize: 16,
          ),
        )
      );
    }
    return listWidgets;

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          new GestureDetector(
              onTap: ()=>{
                this.topTap()
              },
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                new Image.asset('images/discover/discover_topnotice.png',
                    fit: BoxFit.fill),
                new Container(
                  padding: new EdgeInsets.fromLTRB(15, 20, 15, 20),
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      border: new Border(
                          top: new BorderSide(
                              color: Color(0xFFf5f5f5),
                              width: 1,
                              style: BorderStyle.solid))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 8,
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: topItemWidget()
                          ),
                        ),
                        new Container(
                          width: 20,
                          margin: new EdgeInsets.only(left: 20),
                          child: new Icon(
                            Icons.keyboard_arrow_right,
                            color: Color(0xFF999999),
                          ),
                        ),
                      ]),
                )
                //考试咨询
              ])),
          //考试咨询
          new Padding(
            padding: new EdgeInsets.fromLTRB(15, 10, 0, 10),
            child: new Text(
              "考试资讯",
              style: new TextStyle(
                fontSize: 18,
                color: Color(0xFF666666),
              ),
            ),
          )
        ]));
  }
}

