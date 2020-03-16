import 'package:flutter/material.dart';
import 'package:studentinfo/Pages/alternamebtn.dart';

class GroupBtns extends StatefulWidget {
  String header;

  List<String> names = [];
  double btnSize = 0.0;
  int selectedIndex;
  Function setIndex;
  GroupBtns(this.header, this.names,
      {this.btnSize = 80, this.selectedIndex, this.setIndex});

  String get selectedText {
    return (selectedIndex ?? 0) < names.length ? names[selectedIndex ?? 0] : "";
  }

  @override
  _State createState() => _State();
}

class _State extends State<GroupBtns> {
  var _selectedIndex = 0;

  List<AlternateButton> _btns = [];

  _onPressed(int index) {
    print(index);
    widget.selectedIndex = index;
    if (widget.setIndex != null) {
      widget.setIndex(index);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> btnwidgets = [];
    var btnIndex = 0;
    widget.names.forEach((n) {
      btnwidgets.add(SizedBox(width: 5));
      var btn = AlternateButton(btnIndex,
          title: n,
          width: widget.btnSize,
          height: widget.btnSize,
          isSelected: widget.selectedIndex == btnIndex,
          onPressed: _onPressed);
      _btns.add(btn);
      btnIndex++;

      btnwidgets.add(Expanded(child: btn));
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.header),
        SizedBox(
          height: 20,
        ),
        Row(children: btnwidgets)
      ],
    );
  }
}
