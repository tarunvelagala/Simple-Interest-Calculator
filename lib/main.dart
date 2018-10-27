import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Mystate();
    // TODO: implement createState
  }
}

class Mystate extends State {
  var _formkey = GlobalKey<FormState>();

  var _currencies = ['Rupees', 'Dollars', 'Pounds'];
  var _currentItemSelected = '';
  var _displayResult = '';
  @override
  void initState() {
    super.initState();
    _currentItemSelected = _currencies[0];
  }
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();
  String value = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Simple Interest Calculator',
      color: Colors.indigo,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('Simple Interest Calculator'),
        ),
        body: Form(

          key: _formkey,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                Image1(),
                Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    controller: principalController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter a valid Number";
                      }
                      else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      //errorText: 'Please enter a valid number',
                      labelText: 'Principal',
                      hintText: 'In number eg.15000',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        //errorText: 'Please enter a valid number',
                        hintText: 'In Percent',
                        labelText: 'Rate of Interest',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),borderSide: BorderSide(color: Colors.indigo,style:BorderStyle.solid ))),
                    controller: roiController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter a valid amount";
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(

                                //errorText: 'Please enter a valid number',
                            hintText: 'In Years',
                            labelText: 'Term',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        controller: termController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please Enter a valid amount";
                          }
                          else{
                            return null;
                          }
                        },
                      )),
                      Container(
                        width: 5.0,
                      ),
                      Expanded(child: DropdownButton(items: _currencies.map((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(), value: _currentItemSelected,onChanged: (String newValueSelected){
                        _onDropDownItemSelected(newValueSelected);
                      },))
                    ],
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(child: RaisedButton(textColor: Colors.white,child: Text("Calculate",textScaleFactor: 1.5,),onPressed: (){
                        setState(() {
                          if(_formkey.currentState.validate()) {
                            this._displayResult=_calculateTotalReturns();
                          }
                        });
                      },color: Colors.indigo,)),
                      Container(
                        width: 10.0,
                      ),
                      Expanded(child: RaisedButton(textColor: Colors.white,child: Text("Reset",textScaleFactor: 1.5,),onPressed: (){
                        setState(() {
                          _reset();
                        });
                      },color: Colors.pinkAccent))

                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0,bottom: 5.0),child: Text(this._displayResult,style: Theme.of(context).textTheme.body2,),)
              ],
            ),
          ),
          
        ),
      ),
    );
  }
  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;

    String result =
        'After $term years, your investment will be worth $totalAmountPayable $_currentItemSelected';
    return result;
  }
  void _reset() {
    principalController.text = '';
    roiController.text = '';
    termController.text = '';
    _displayResult = '';
    _currentItemSelected = _currencies[0];
  }
  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
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
