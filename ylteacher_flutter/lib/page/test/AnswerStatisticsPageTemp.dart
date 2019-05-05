import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AnswerStatisticsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    // TODO: implement createState
    return AnswerStatisticsState();
  }
}

class AnswerStatisticsState extends State<AnswerStatisticsPage> with  SingleTickerProviderStateMixin{

//  TabController _tabController;
  int _currentPageIndex = 0;
  var _pageController = new PageController(initialPage: 0);

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
  @override
  void dispose() {
//    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: new CupertinoNavigationBar(
            middle: Text("答疑统计",style: TextStyle(fontSize: 20),),
            backgroundColor:Colors.white
        ),
        body:  new Column(
          children: <Widget>[
            TopBar(index:_currentPageIndex,itemClick:(index)=>{
              onTap(index)
            }),
            Expanded(
              child: new PageView.builder(
                onPageChanged:_pageChange,
                controller: _pageController,
                itemBuilder: (BuildContext context,int index){
                  return _currentPageIndex==0 ? new TestPage1():new TestPage2();
                },
                itemCount: 2,
              ),
            )
          ],
        )
    );

  }
  void onTap(int index) {
    // 过pageview的pagecontroller的animateToPage方法可以跳转
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _pageChange(int index) {

    setState(() {
      if (_currentPageIndex != index) {

        setState(() {
          _currentPageIndex = index;
        });

      }
    });
  }
}
class TopBar extends StatelessWidget{
  final int index;
  final Function itemClick;
  const TopBar({
    this.index,
    this.itemClick,
});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 44,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: ()=>{this.itemClick(0)},
                        child: Center(
                          child: Text("本月统计"),
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: ()=>{this.itemClick(1)},
                        child: Center(
                          child: Text("上月统计"),
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color:  Color.fromRGBO(0, 0, 0, 0.1),
              )
            ],
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width/4 - 15 + (MediaQuery.of(context).size.width/2)*index,
          width: 30,
          top: 42,
          height: 3,
          child: Container(
            width: 30,
            height: 3,
            color: Color(0xFFE73928),
          ),
        )
      ],
    );
  }

}
class TestPage1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TestPageState1();
  }

}
class TestPageState1 extends State<TestPage1>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('本月'),
    );
  }

}
class TestPage2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TestPageState2();
  }

}
class TestPageState2 extends State<TestPage2>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('上月'),
    );
  }

}