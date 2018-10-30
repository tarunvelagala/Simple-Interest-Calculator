import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return MyState();
  }
}

ThemeData buildTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    hintColor: Colors.indigo,
    errorColor: Colors.pinkAccent


  );
}
class MyState extends State {
  void initState() {
    super.initState();
  }
  var _displayResult = '';
  var _formkey = GlobalKey<FormState>();
  bool _autoValidate = false;
  TextEditingController _principalController = TextEditingController();
  TextEditingController _roiController = TextEditingController();
  TextEditingController _termController = TextEditingController();
  String value = '';
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return new MaterialApp(
      theme: buildTheme(),
      title: 'Simple Interest Calculator',
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
                key: _formkey, autovalidate: _autoValidate, child: formUI()),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget formUI() {
    return new Column(
      children: <Widget>[
        Image1(),
        new Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: TextFormField(
              autofocus: true,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please Enter a valid number';
                }
              },
              controller: _principalController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(icon: Icon(Icons.clear,color: Colors.pinkAccent,size: 15.0), onPressed: (){_principalController.clear();}),
                  labelText: "Principal",
                  labelStyle: TextStyle(color: Colors.indigo),
                  hintText: 'eg.12000',
                  prefixIcon:
                  const Icon(Icons.attach_money, color: Colors.pinkAccent),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.indigo))),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            )),
        new Padding(
            padding: EdgeInsets.only(bottom: 30.0),
            child: TextFormField(
              validator: (String arg) {
                if (arg.isEmpty) {
                  return 'Enter a valid number';
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
                  suffixIcon: IconButton(icon: Icon(Icons.clear,color: Colors.pinkAccent,size: 15.0,), onPressed: (){_roiController.clear();}),
                  border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(5.0),)),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            )),
        new Padding(
            padding: EdgeInsets.only(bottom: 30.0),
            child: TextFormField(
              validator: (String arg) {
                if (arg.isEmpty) {
                  return 'Enter a valid number';
                }
              },
              controller: _termController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(icon: Icon(Icons.clear,color: Colors.pinkAccent,size: 15.0), onPressed: (){_termController.clear();}),
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
                          setState(() {
                            if (_formkey.currentState.validate()) {
                              this._displayResult = _calculateTotalReturns();
                            }

                          });
                        },
                        color: Colors.indigo,
                        elevation: 5.0,
                        child: new Text(
                          "CALCULATE",style: TextStyle(color: Colors.white),
                        ))),
                new Container(width: 50.0),
                new Container(
                    height: 40.0,
                    width: 120.0,
                    child: new RaisedButton(
                        onPressed: () {
                          setState(() {
                            _reset();
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
        new Text(this._displayResult, style: Theme.of(context).textTheme.body2),
      ],
    );
  }
  String _calculateTotalReturns() {
    double principal = double.parse(_principalController.text);
    double roi = double.parse(_roiController.text);
    double term = double.parse(_termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;

    String result =
        'After $term years, your investment will be worth $totalAmountPayable';
    return result;
  }
  void _reset() {
    _principalController.text = '';
    _roiController.text = '';
    _termController.text = '';
    _displayResult = '';

    //_currentItemSelected = _currencies[0];
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
      height: 120.0,
      child: image,
    );

  }
}

