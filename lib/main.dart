import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: 'Boder Radius Preview',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color _hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  final _paddingInput = 7.0;

  String codeCSS = "{ border-radius: 0px 0px 0px 0px; }";

  double borderRadiusTopLeft = 0;
  double borderRadiusTopRight = 0;
  double borderRadiusBottomRight = 0;
  double borderRadiusBottomLeft = 0;

  TextEditingController inputBorderTopLeft = TextEditingController()
    ..text = '0';
  TextEditingController inputBorderTopRight = TextEditingController()
    ..text = '0';
  TextEditingController inputBorderBottomRight = TextEditingController()
    ..text = '0';
  TextEditingController inputBorderBottomLeft = TextEditingController()
    ..text = '0';

  void _resetFields() {
    inputBorderTopLeft.text = '0';
    inputBorderBottomLeft.text = '0';
    inputBorderBottomRight.text = '0';
    inputBorderTopRight .text = '0';
    setState(() {
      codeCSS = "{ border-radius: 0px 0px 0px 0px; }";
      borderRadiusTopLeft = 0;
      borderRadiusTopRight = 0;
      borderRadiusBottomRight = 0;
      borderRadiusBottomLeft = 0;
    });
  }

  void _changeBorderValue(String value, String which) {
    setState(() {
      if (which == 'TL')
        borderRadiusTopLeft = double.parse(value);
      else if (which == 'TR')
        borderRadiusTopRight = double.parse(value);
      else if (which == 'BR')
        borderRadiusBottomRight = double.parse(value);
      else if (which == 'BL') borderRadiusBottomLeft = double.parse(value);

      codeCSS = "{ border-radius: " +
          borderRadiusTopLeft.toStringAsFixed(0) +
          "px " +
          borderRadiusTopRight.toStringAsFixed(0) +
          "px " +
          borderRadiusBottomRight.toStringAsFixed(0) +
          "px " +
          borderRadiusBottomLeft.toStringAsFixed(0) +
          "px; }";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Border Radius Preview"),
          centerTitle: true,
          backgroundColor: Colors.pink,
          actions: <Widget> [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _resetFields();
              },
            )
          ],
        ),
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
                child: Stack(children: <Widget>[
              Image.asset(
                "images/bg.jpg",
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height -
                    Scaffold.of(context).appBarMaxHeight,
                width:  MediaQuery.of(context).size.width,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                right: _paddingInput,
                                bottom: 20.0,
                                left: _paddingInput,
                              ),
                              child: Container(
                                  width: 50.0,
                                  height: 30.0,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: inputBorderTopLeft,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold),
                                    onChanged: (text) =>
                                        {_changeBorderValue(text, 'TL')},
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.indigoAccent[100],
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0)))),
                                  ))),
                          Padding(
                              padding: EdgeInsets.only(
                                right: _paddingInput,
                                bottom: 20.0,
                                left: _paddingInput,
                              ),
                              child: Container(
                                  width: 50.0,
                                  height: 30.0,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: inputBorderTopRight,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold),
                                    onChanged: (text) =>
                                        {_changeBorderValue(text, 'TR')},
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.indigoAccent[100],
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0)))),
                                  ))),
                          Padding(
                              padding: EdgeInsets.only(
                                right: _paddingInput,
                                bottom: 20.0,
                                left: _paddingInput,
                              ),
                              child: Container(
                                  width: 50.0,
                                  height: 30.0,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: inputBorderBottomRight,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold),
                                    onChanged: (text) =>
                                        {_changeBorderValue(text, 'BR')},
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.indigoAccent[100],
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0)))),
                                  ))),
                          Padding(
                              padding: EdgeInsets.only(
                                right: _paddingInput,
                                bottom: 20.0,
                                left: _paddingInput,
                              ),
                              child: Container(
                                  width: 50.0,
                                  height: 30.0,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: inputBorderBottomLeft,
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold),
                                    onChanged: (text) =>
                                        {_changeBorderValue(text, 'BL')},
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.indigoAccent[100],
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0)))),
                                  ))),
                        ],
                      ),
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.ease,
                        width: 246.0,
                        height: 194.0,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Colors.red[200], Colors.pinkAccent],
                              stops: [0.0, 0.6],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(borderRadiusTopLeft),
                              topRight: Radius.circular(borderRadiusTopRight),
                              bottomRight:
                                  Radius.circular(borderRadiusBottomRight),
                              bottomLeft:
                                  Radius.circular(borderRadiusBottomLeft),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Container(
                          color: _hexToColor('#2A3243'),
                          width: 246.0,
                          height: 65.0,
                          child: Align(
                              alignment: Alignment.center,
                              child: RichText(
                                  text: TextSpan(
                                      text: "{\n",
                                      style: TextStyle(
                                        color: _hexToColor("#E9A555"),
                                      ),
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: '     border-radius: ',
                                        style: TextStyle(
                                          color: _hexToColor("#52B6FF"),
                                          fontSize: 11.0,
                                        )),
                                    TextSpan(
                                        text: borderRadiusTopLeft
                                                .toStringAsFixed(0) +
                                            'px ' +
                                            borderRadiusTopRight
                                                .toStringAsFixed(0) +
                                            'px ' +
                                            borderRadiusBottomRight
                                                .toStringAsFixed(0) +
                                            'px ' +
                                            borderRadiusBottomLeft
                                                .toStringAsFixed(0) +
                                            'px',
                                        style: TextStyle(
                                          color: _hexToColor("#CA6FB6"),
                                          fontSize: 11.0,
                                        )),
                                    TextSpan(
                                        text: ';\n',
                                        style: TextStyle(
                                          color: _hexToColor("#FFFFFF"),
                                        )),
                                    TextSpan(
                                        text: '}',
                                        style: TextStyle(
                                          color: _hexToColor("#E9A555"),
                                        )),
                                  ]))),
                        ),
                      ),
                      FlatButton(
                        child: Text("Copy Code", style: TextStyle(color: Colors.white),),
                        onPressed: () {
                          Clipboard.setData(new ClipboardData(text: codeCSS));
                        },
                      )
                    ],
                  ))
            ]));
          },
        ));
  }
}
