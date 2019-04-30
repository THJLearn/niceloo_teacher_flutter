import 'package:flutter/material.dart';

class NavBackWidget extends StatelessWidget {
  final String icon;
  final Function back;

  const NavBackWidget({
    Key key,
    this.icon,
    this.back,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () => {this.back()},
          child: Image.asset(
            "images/base_back.png",
            width: 24,
            height: 24,
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }
}
