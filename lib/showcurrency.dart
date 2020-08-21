import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class showcurrency extends StatefulWidget {
  showcurrency({Key key, this.number}) : super(key: key);
  //List<namemodel> namewithprice = [];
  String number;
  @override
  _showcurrencyState createState() => _showcurrencyState(number);
}

class _showcurrencyState extends State<showcurrency> {
  String num;
  _showcurrencyState(this.num);
  //static const url = 'https://api.exchangeratesapi.io/latest?base=INR';

  // void initState() {
  //   final response = getcurrencyval();
  //   Map map = json.decode(response.body);
  //   Map rates = map['rates'];
  //   //Iterable rates = map['rates'];
  //   //namewithprice = rates.map((model) => namemodel.fromJson(model)).toList();
  //   rates.forEach((key, value) {
  //     name.add(key);
  //     price.add(value);
  //   });
  // }

  // List<String> name = [];
  // List<double> price = [];
  // bool isLoading;
  // setLoading(bool state) {
  //   setState(() => isLoading = state);
  // }

  // getcurrencyval() async {
  //   try {
  //     setLoading(true);
  //     await getdata();
  //   } finally {
  //     setLoading(false);
  //   }
  // }

  // getdata() async {
  //   final response = await http.get(url);
  //   return response;
  // }
  Map _curconvert = new Map();
  Map _rates = new Map();
  void _getData() async {
    var url = "https://api.exchangeratesapi.io/latest?base=INR";
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        _curconvert = json.decode(response.body);
        _rates = _curconvert['rates'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.number + " Equal to"),
      ),
      body: ListView.builder(
        itemCount: _rates.length,
        itemBuilder: (BuildContext context, int index) {
          String key = _rates.keys.elementAt(index);
          double num1 = (_rates[key] * double.parse(num));
          return Container(
            margin: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${key} :',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text('${num1.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20.0))
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    _getData();
  }
}
