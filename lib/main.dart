import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:shuttle_calculator/pages/login.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        imageBackground: AssetImage('assets/images/splashScreen.jpg'),
        seconds: 4,
        navigateAfterSeconds: new Login(),
        title: new Text(
          'Welcome to Shuttle Calculator!',
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red);
  }
}

//const kDefaultPadding = EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 15);

//MaterialApp(
//theme: ThemeData.dark(),
//home: Scaffold(
//appBar: AppBar(
//title: Text('Shuttle Calculator'),
//backgroundColor: Colors.green[700],
//),
//body: Content(),
//),
//initialRoute: '/',
//);

//class Content extends StatefulWidget {
//  @override
//  _ContentState createState() => _ContentState();
//}
//
//class _ContentState extends State<Content> {
//  final hallFees = TextEditingController();
//  final numberOfPlayers = TextEditingController();
//  final pricePerShuttle = TextEditingController();
//  final numberOfMatches = TextEditingController();
//  String result;
//
//  void calculateTotal() {
//    final double hallF = double.parse(hallFees.text);
//    final double priceShuttle = double.parse(pricePerShuttle.text);
//    final int players = int.parse(numberOfPlayers.text);
//    final int matches = int.parse(numberOfMatches.text);
//
//    result = ((hallF / players) + (priceShuttle * matches)).toStringAsFixed(2);
//
//    print(result);
//  }
//
//  showAlertDialog(BuildContext context) {
//    // set up the button
//    Widget okButton = FlatButton(
//      child: Text("OK"),
//      onPressed: () {
//        Navigator.pop(context);
//        numberOfMatches.clear();
//      },
//    );
//
//    // set up the AlertDialog
//    AlertDialog alert = AlertDialog(
//      title: Text("Total"),
//      content: Text("You need to pay RM$result"),
//      actions: [
//        okButton,
//      ],
//    );
//
//    // show the dialog
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        return alert;
//      },
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.stretch,
//      children: <Widget>[
//        Expanded(
//          flex: 4,
//          child: Container(
//            child: SingleChildScrollView(
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Padding(
//                    padding: kDefaultPadding,
//                    child: Text('Hall Fees (RM)'),
//                  ),
//                  InputCard(
//                      textController: hallFees,
//                      labelText: 'Hall Fees',
//                      hintText: '15.00'),
//                  Padding(
//                    padding: kDefaultPadding,
//                    child: Text('Number of Players'),
//                  ),
//                  InputCard(
//                      textController: numberOfPlayers,
//                      labelText: 'Number of Players',
//                      hintText: '10'),
//                  Padding(
//                    padding: kDefaultPadding,
//                    child: Text('Price per Shuttle (RM)'),
//                  ),
//                  InputCard(
//                      textController: pricePerShuttle,
//                      labelText: 'Price per shuttlecock (RM)',
//                      hintText: '2.00'),
//                  Padding(
//                    padding: kDefaultPadding,
//                    child: Text('Number of matches played'),
//                  ),
//                  InputCard(
//                      textController: numberOfMatches,
//                      labelText: 'Number of matches played',
//                      hintText: '2'),
//                ],
//              ),
//            ),
//            margin: EdgeInsets.all(15),
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(10.0),
//              color: Colors.green[900],
//            ),
//          ),
//        ),
//        Expanded(
//          flex: 1,
//          child: FlatButton(
//            onPressed: () {
//              calculateTotal();
//              showAlertDialog(context);
//            },
//            color: Colors.green[700],
//            child: Text('Calculate!'),
//          ),
//        ),
//      ],
//    );
//  }
//}
