import 'package:flutter/material.dart';

class InputCard extends StatefulWidget {
  InputCard(
      {@required this.textController,
      @required this.labelText,
      @required this.hintText});

  final TextEditingController textController;
  final String labelText;
  final String hintText;

  @override
  _InputCardState createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextField(
        controller: widget.textController,
        keyboardType: TextInputType.numberWithOptions(),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: widget.labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(19.0),
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
