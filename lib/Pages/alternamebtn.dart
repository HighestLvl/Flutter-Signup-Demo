import 'package:flutter/material.dart';

class AlternateButton extends StatelessWidget {
  Function onPressed;
  int tag;
  String title;
  double width;
  double height;
  bool isSelected = false;
  Color color;
  AlternateButton(
    this.tag,
      {this.title,
      this.isSelected = false,
      this.onPressed,
      this.width = 50.0,
      this.height = 50.0,
      this.color = Colors.blue});
 
 
  var selectedColor = Color.fromRGBO(109, 135, 187, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height:   height,
        child: FlatButton(
          child: Text(
            title ?? "",
            style: TextStyle(
                color:  isSelected ? selectedColor : Colors.grey,
                fontWeight:
                     isSelected ? FontWeight.bold : FontWeight.normal),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(
                  width: isSelected ? 4 : 0,
                  color:  isSelected ? selectedColor : Colors.grey)),
          onPressed: () {
             onPressed( tag);
          },
        ));
  }
}
