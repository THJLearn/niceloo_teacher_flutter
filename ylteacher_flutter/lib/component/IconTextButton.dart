import 'package:flutter/material.dart';
class IconTextButton extends StatelessWidget{

  final String icon;
  final String text;
  final  double size ;
  final double fontsize;
  final Function onTap;

  const IconTextButton({
    Key key,
    this.icon,
    this.text,
    this.onTap,
    this.size,
    this.fontsize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(

      onTap:onTap,
      child: Container(
        width: 50,
        decoration: new BoxDecoration(
        ),
        child:  Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Image.asset(this.icon,width: this.size ==null ? 20 :this.size ,height: this.size ==null ? 20 :this.size),
            Text(text, style:new TextStyle(
              fontSize: this.fontsize == null ?12 : this.fontsize,
            )),
          ],
        ),
      )


    );
  }

}