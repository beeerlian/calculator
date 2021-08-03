import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/model/tombol.dart';
import 'package:math_expressions/math_expressions.dart';

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  MainBodyState createState() => MainBodyState();
}

class MainBodyState extends State<MainBody> {
  String _expresi = "";
  String _history = "";

  void numOnClick(String text) {
    setState(() {
      _expresi += text;
    });
  }

  void equal(String text) {
    setState(() {
      Parser parser = Parser();
      Expression exp = parser.parse(_expresi);
      ContextModel model = ContextModel();
      _history = _expresi;

      if (exp.evaluate(EvaluationType.REAL, model).ceil() ==
          exp.evaluate(EvaluationType.REAL, model))
        _expresi = (exp.evaluate(EvaluationType.REAL, model).ceil()).toString();
      else
        _expresi = exp.evaluate(EvaluationType.REAL, model).toString();
      listHistory.add("$_history=$_expresi");
    });
  }

  void delete(String text) {
    setState(() {
      if (_expresi != null)
        _expresi = _expresi.substring(0, _expresi.length - 1);
    });
  }

  void totalClear(String text) {
    setState(() {
      _expresi = "";
      _history = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Tombol> listTombol = [
      Tombol(text: "del", tombolOnTap: delete),
      Tombol(text: "AC", tombolOnTap: totalClear),
      Tombol(text: "*", tombolOnTap: numOnClick),
      Tombol(text: "/", tombolOnTap: numOnClick),
      Tombol(text: "1", tombolOnTap: numOnClick),
      Tombol(text: "2", tombolOnTap: numOnClick),
      Tombol(text: "3", tombolOnTap: numOnClick),
      Tombol(text: "+", tombolOnTap: numOnClick),
      Tombol(text: "4", tombolOnTap: numOnClick),
      Tombol(text: "5", tombolOnTap: numOnClick),
      Tombol(text: "6", tombolOnTap: numOnClick),
      Tombol(text: "--", tombolOnTap: numOnClick),
      Tombol(text: "7", tombolOnTap: numOnClick),
      Tombol(text: "8", tombolOnTap: numOnClick),
      Tombol(text: "9", tombolOnTap: numOnClick),
      Tombol(text: ".", tombolOnTap: numOnClick),
      Tombol(text: "00", tombolOnTap: numOnClick),
      Tombol(text: "0", tombolOnTap: numOnClick),
      Tombol(
        text: "=",
        tombolOnTap: equal,
        color: Colors.amber.shade800,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.only(top: 60, right: 40, left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        _history == "" ? "" : "$_history =",
                        style: TextStyle(fontSize: 20, color: Colors.white70),
                      ),
                      Text(
                        _expresi,
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: listTombol.map((e) => e).toList(),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 40),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return Scaffold(body: History(),backgroundColor: Colors.white10,appBar: AppBar(backgroundColor: Colors.white10,),);
                }));
              },
              icon: Icon(
                Icons.history,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listHistory
          .map((e) => Container(
            padding: EdgeInsets.only(left: 25, top: 15),
                child: Text(e, style: TextStyle(fontSize: 20, color: Colors.white),),
              ))
          .toList(),
    );
  }
}
