import 'package:flutter/material.dart';
class NLText extends StatelessWidget{

  final String text;
  final  double size ;
  final double fontsize;
  final Function onTap;

  const NLText({
    Key key,
    this.text,
    this.onTap,
    this.size,
    this.fontsize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: Text(
          text,
      ),
    );
  }

}