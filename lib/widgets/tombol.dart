import 'package:flutter/material.dart';

class Tombol extends StatelessWidget {
  final text;
  final Function tombolOnTap;
  final double? width;
  final Color? color;
  const Tombol(
      {Key? key, required this.text, required this.tombolOnTap, this.width, this.color=Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      height: width,
      width: width,
      child: RaisedButton(
        color: color,
        onPressed: () => tombolOnTap(text),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(text, style: TextStyle(fontSize: 20),),
      ),
    );
  }
}

List<String> listHistory = [];
