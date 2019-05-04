import 'dart:async';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/DiscoverItemModel.dart';
import 'package:flutter/cupertino.dart';
import '../../Constants/Constants.dart';
import 'component/StatisticsGridView.dart';

class AnswerStatisticsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnswerStatisticsState();
  }
}

class AnswerStatisticsState extends State<AnswerStatisticsPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("pageinitState----------");
    print(window.defaultRouteName);
    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
//    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new CupertinoNavigationBar(
            middle: Text(
              "答疑统计",
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.white),
        body: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 45.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 0.1), width: 1))),
              child: TabBar(
                tabs: <Widget>[
                  Tab(
                    child: Center(
                      child: Text(
                        "本月统计",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Tab(
                    child: Center(
                      child: Text(
                        "上月统计",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
                isScrollable: false,
                labelColor: Color(0xFF333333),
                unselectedLabelColor: Color(0xFF999999),
                indicator: YLStatisticsIndictor(),
                controller: _tabController,
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: <Widget>[AnswerStatisticsList(), TestPage2()],
            ))
          ],
        ));
  }

//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        elevation: 0.5,
//        backgroundColor: Colors.white,
//        title: new Text('顶部tab切换'),
//        bottom: new TabBar(
//          indicatorPadding:new EdgeInsets.only(left: 80,right: 80),
//            indicatorColor:Colors.red,
//          tabs: <Widget>[
//            new Tab(
//              child: Text("本月统计",style: TextStyle(color: Colors.black),),
//            ),
//            new Tab(
//              child: Text("上月统计",style: TextStyle(color: Colors.black),),
//            ),
//          ],
//          controller: _tabController,
//        ),
//      ),
//      body: new TabBarView(
//        controller: _tabController,
//        children: <Widget>[
//          new Center(child: new Text('本月')),
//          new Center(child: new Text('上月')),
//        ],
//      ),
//    );
//  }

}

class AnswerStatisticsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnswerStatisticsListState();
  }
}

class AnswerStatisticsListState extends State<AnswerStatisticsList> {

  List list =[];

  Future<Null> _loadRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        return null;
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = [
      {"number":"100","title":"非常满意"},
      {"number":"350","title":"满意"},
      {"number":"241","title":"不评价"},
      {"number":"100","title":"不满意"},
      {"number":"199","title":"转入"},
      {"number":"44","title":"转出"},
      {"number":"1230","title":"超时转出"},
      {"number":"340","title":"超时解答"},
      {"number":"120","title":"不合理关闭"},
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RefreshIndicator(
      onRefresh: _loadRefresh,
      child: ListView(
        children: <Widget>[
          topDateView(),
          middleNumberWidget(),
          WrapWidget(),

        ],
      ),
    );
  }

  //日期，提示
  Widget topDateView() {
    return Container(
      padding: new EdgeInsets.fromLTRB(20, 20, 20, 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "2019年3月",
            style: TextStyle(fontSize: 16, color: Constants.nlColors.color333),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: new EdgeInsets.only(right: 7),
                child: Image.asset(
                  "images/statistics/icon_statistics_mark.png",
                  width: 9,
                  height: 10,
                ),
              ),
              Text(
                "按照问题关闭时间统计",
                style:
                    TextStyle(fontSize: 12, color: Constants.nlColors.color999),
              ),
            ],
          )
        ],
      ),
    );
  }

  //答疑数量，排名
  Widget middleNumberWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: middleItem(0,569),
            flex: 1,
          ),
          Expanded(
            child: middleItem(1,10),
            flex: 1,
          )
        ],
      ),
    );
  }

  Widget middleItem(index,number) {
    return Container(
        height: 87,
        margin: new EdgeInsets.fromLTRB(index==0? 20:7.5, 20 , index==0? 7.5:20,20),
        decoration: new BoxDecoration(
          color: Colors.white,
// 阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
          boxShadow: [
            BoxShadow(
                color: Color(0x99f2f2f2),
                offset: Offset(0, 3.0),
                blurRadius: 3.0,
                spreadRadius: 2.0),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 14,
            ),
            Expanded(
              child:Container(
                height: 50,
                child: Row(
                  children: <Widget>[
                    Image.asset(index==0 ?  "images/statistics/icon_statistics_number.png": "images/statistics/icon_statistics_sort.png",width: 50,height: 50,),
                    SizedBox(
                      width:10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(index==0 ? "答疑数量":"答疑排名",style: TextStyle(
                          color: Constants.nlColors.color666,
                          fontSize: 14,
                        ),),
                        Text("569",style: TextStyle(
                          color: Constants.nlColors.color333,
                          fontSize: 20,
                        ),)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }

  Widget WrapWidget(){
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
// 阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
        boxShadow: [
          BoxShadow(
              color: Color(0x99f2f2f2),
              offset: Offset(0, 3.0),
              blurRadius: 3.0,
              spreadRadius: 2.0),
        ],
      ),
      margin: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width-40,
      child: Wrap(
        spacing: 0,
        runSpacing: 0,
        children: list.map((city) {
          return _getGridViewItemUI(context, city);
        }).toList(),
      ),
    );
  }
  Widget _getGridViewItemUI(BuildContext context,city) {
    return InkWell(
      onTap: () {
      },
        child: Container(
          width: (MediaQuery.of(context).size.width-40)/3,
          height: 70,
          child: Column(
            children: <Widget>[
              Text("256"),
              Text("非常满意")
            ],
          ),
        )
    );
  }
}

class TestPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TestPageState2();
  }
}

class TestPageState2 extends State<TestPage2> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('上月'),
    );
  }
}

class YLStatisticsIndictor extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback onChanged]) {
    return _YLIndictorPainter();
  }
}

class _YLIndictorPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint();
    paint.color = Colors.red;
    paint.style = PaintingStyle.fill;
    // final w = configuration.size.width / 10;
    // final h = configuration.size.width / 20;
    final w = 30.0;
    final h = 2.7;
    canvas.drawRect(
        Rect.fromLTWH(offset.dx - w / 2 + configuration.size.width / 2,
            configuration.size.height - h, w, h),
        paint);
  }
}

