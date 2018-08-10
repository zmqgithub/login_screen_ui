import 'package:flutter/material.dart';
import 'shbackground.dart';
import 'logo_hexa.dart';
import 'custom_textfield.dart';
import 'background.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    myController.removeListener(_printLatestValue);
    myController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("Second text field: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final input = new TextField(
      textAlign: TextAlign.center,
      decoration: new InputDecoration.collapsed(
        hintText: "The hint text",
      ),
      obscureText: false,
    );

    return new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.yellow[800], Colors.red]
              ,begin: Alignment.topRight, end: Alignment.bottomLeft, tileMode: TileMode.clamp,
              )
            ),
          ),
          new CustomPaint(
            painter: new Background(),
            size: Size(width, height),
          ),
          new Scaffold(
            appBar: new AppBar(
              title: new Text(widget.title),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            body:  new Container(
              child: new Stack(children: <Widget>[
                new Align(alignment: Alignment.topCenter,
                child: new Text('GUFRA', style: TextStyle(fontSize: height/20,
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.7)),),),
              Padding(padding: EdgeInsets.only(top: height/5,left: width/20, right: width/20),
              child: new Container(
                  height: 4*height/10,
                  width: 9*width/10,
                  decoration: BoxDecoration(color: Colors.white.withOpacity(1.0),
                      boxShadow: [new BoxShadow(color: Colors.black54.withOpacity(0.5), blurRadius: 2.0,
                      offset: Offset(2.0, 2.0)),],
                      borderRadius: BorderRadius.all(new Radius.circular(10.0))),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                  new SizedBox(height: width/6,),
                  new SHTextField(controller: myController,hintText: 'Username',icon: Icons.account_circle,),
                  new SHTextField(controller: myController,hintText: 'Password', obscure: true, icon: Icons.security,),
                  new SizedBox(height: width/12,),
                    new InkWell(child: Container(
                      child: new Text('LOGIN',
                        style: TextStyle(fontSize: height/50, color: Colors.white, fontWeight: FontWeight.bold),),
                      width: width/1.5,
                      height: height/18,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: width/10, right: width/10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(new Radius.circular(height/9)),
                          gradient: LinearGradient(colors: [Colors.red, Colors.yellow[700]],
                              begin: Alignment.topRight, end: Alignment.bottomLeft,
                              tileMode: TileMode.clamp)),),
                    ),
                    SizedBox(height: height/16, child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Text('You don\'t have an account?', style: TextStyle(fontSize: height/70),),
                      FlatButton(onPressed: (){}, child: Text('Sign Up',
                      style: TextStyle(fontSize: height/60, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal,),))
                    ],),)
              ],),),),
                Padding(padding: EdgeInsets.only(top: height/5-width/8, left: width/2-width/8),
                child: new HexagoneLogo(),)
            ],),),

          )
        ],
      ),
    );
  }
}
