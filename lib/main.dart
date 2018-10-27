import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return MyState();
  }
}

class MyState extends State {
  void initState() {
    super.initState();
  }

  var _formkey = GlobalKey<FormState>();
  bool _autoValidate = false;
  TextEditingController _principalController = TextEditingController();
  TextEditingController _roiController = TextEditingController();
  TextEditingController _termController = TextEditingController();
  double _principal;
  double _roi;
  double _term;
  double totalAmountPayable;
  String result = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      color: Colors.indigo,
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.indigo,
          title: Text("Simple Interest Calculator"),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
                key: _formkey, autovalidate: _autoValidate, child: FormUI()),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget FormUI() {
    return new Column(
      children: <Widget>[
        Image1(),
        new Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: TextFormField(
              validator: (String arg) {
                if (arg.isEmpty) {
                  return 'Enter a valid number';
                } else {
                  return null;
                }
              },
              controller: _principalController,
              decoration: InputDecoration(
                  labelText: "Principal",
                  labelStyle: TextStyle(color: Colors.indigo),
                  hintText: 'eg.12000',
                  prefixIcon:
                      const Icon(Icons.attach_money, color: Colors.pinkAccent),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo))),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            )),
        new Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: TextFormField(
              validator: (String arg) {
                if (arg.isEmpty) {
                  return 'Enter a valid number';
                } else {
                  return null;
                }
              },
              controller: _roiController,
              decoration: InputDecoration(
                  labelText: "Rate of Interest",
                  labelStyle: TextStyle(color: Colors.indigo),
                  hintText: 'eg.2 years',
                  prefixIcon: const Icon(
                    Icons.show_chart,
                    color: Colors.pinkAccent,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            )),
        new Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: TextFormField(
              validator: (String arg) {
                if (arg.isEmpty) {
                  return 'Enter a valid number';
                } else {
                  return null;
                }
              },
              controller: _termController,
              decoration: InputDecoration(
                  labelText: "Term",
                  labelStyle: TextStyle(color: Colors.indigo),
                  prefixIcon: const Icon(
                    Icons.access_time,
                    color: Colors.pinkAccent,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            )),
        Padding(
            padding: EdgeInsets.all(20.0),
            child: new Row(
              children: <Widget>[
                new Container(
                    height: 40.0,
                    width: 120.0,
                    child: new RaisedButton(
                        onPressed: () {
                          _principal = double.parse(_principalController.text);
                          _roi = double.parse(_roiController.text);
                          _term = double.parse(_termController.text);
                          setState(() {
                            if (_formkey.currentState.validate()) {
                              this.result = _result();
                            }
                            totalAmountPayable = _principal + (_principal * _roi * _term) / 100;
                          });
                        },
                        color: Colors.indigo,
                        elevation: 5.0,
                        child: new Text(
                          "CALCULATE",
                          style: TextStyle(color: Colors.white),
                        ))),
                new Container(width: 50.0),
                new Container(
                    height: 40.0,
                    width: 120.0,
                    child: new RaisedButton(
                        onPressed: () {
                          setState(() {
                            _principalController.text = '';
                            _termController.text = '';
                            _roiController.text = '';
                            result = "";
                          });
                        },
                        color: Colors.pink,
                        elevation: 5.0,
                        child: new Text(
                          "RESET",
                          style: TextStyle(color: Colors.white),
                        ))),
              ],
            )),
        new Text(this.result, style: Theme.of(context).textTheme.body2),
      ],
    );
  }

  String _result() {
    result =
        "After $_term years, your investment will be worth $totalAmountPayable rupees";
    return result;
  }
}

class Image1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('images/percentage.png');
    Image image = Image(
      image: assetImage,
      width: 100.0,
      height: 100.0,
    );
    return Container(
      padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
      width: 80.0,
      height: 150.0,
      child: image,
    );
  }
}
