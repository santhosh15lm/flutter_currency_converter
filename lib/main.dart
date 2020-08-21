import 'package:currency_converter/showcurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Currency converter'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String val = '';
  final myController = TextEditingController();
  gettextvalue() {
    setState(() {
      val = myController.text;
    });
  }

  void intiState() {
    super.initState();
    myController.addListener(() {
      gettextvalue();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Center(
                  child: Image.asset(
                    "assets/logopng.png",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.0),
                alignment: Alignment.center,
                height: 80.0,
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                child: TextField(
                  controller: myController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      hintText: "enter the amout in Rupees",
                      border: InputBorder.none,
                      icon:
                          Icon(Icons.account_balance, color: Colors.grey[600])),
                  onSubmitted: (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => showcurrency(number: value))),
                  onChanged: (value) => {val = value},
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100.0))),
                child: RaisedButton(
                  child: Text(
                    "click to convert",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.blueAccent,
                  onPressed: () => {
                    gettextvalue(),
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => showcurrency(
                                  number: val,
                                )))
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
