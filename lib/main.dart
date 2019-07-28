import 'package:flutter/material.dart';

void main() => runApp(MyApp());

const kDefaultPadding = EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 15);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
//        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Shuttle Calculator'),
          backgroundColor: Colors.green[700],
        ),
        body: Content(),
      ),
    );
  }
}

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final hallFees = TextEditingController();
  final numberOfPlayers = TextEditingController();
  final pricePerShuttle = TextEditingController();
  final numberOfMatches = TextEditingController();
  String result;

  void calculateTotal() {
    final double hallF = double.parse(hallFees.text);
    final double priceShuttle = double.parse(pricePerShuttle.text);
    final int players = int.parse(numberOfPlayers.text);
    final int matches = int.parse(numberOfMatches.text);

    result = ((hallF / players) + (priceShuttle * matches)).toStringAsFixed(2);

    print(result);
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        numberOfMatches.clear();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Total"),
      content: Text("You need to pay RM$result"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: kDefaultPadding,
                    child: Text('Hall Fees (RM)'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      controller: hallFees,
                      keyboardType: TextInputType.numberWithOptions(),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: 'Hall Fees',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(19.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: '15.00',
                      ),
                    ),
                  ),
                  Padding(
                    padding: kDefaultPadding,
                    child: Text('Number of Players'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: numberOfPlayers,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: 'Number of players',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(19.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: '10',
                      ),
                    ),
                  ),
                  Padding(
                    padding: kDefaultPadding,
                    child: Text('Price per Shuttle (RM)'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: pricePerShuttle,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: 'Price per shuttle (RM)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(19.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: '2.00',
                      ),
                    ),
                  ),
                  Padding(
                    padding: kDefaultPadding,
                    child: Text('Number of matches played'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: numberOfMatches,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: 'Number of matches played',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(19.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: '2',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.green[900],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: FlatButton(
            onPressed: () {
              calculateTotal();
              showAlertDialog(context);
            },
            color: Colors.green[700],
            child: Text('Calculate!'),
          ),
        ),
      ],
    );
  }
}
