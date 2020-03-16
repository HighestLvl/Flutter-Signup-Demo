import 'package:flutter/material.dart';
import 'package:platform_alert_dialog/platform_alert_dialog.dart';
import 'package:studentinfo/Pages/groupbtn.dart';
import 'package:intl/intl.dart';

class EntryPage extends StatefulWidget {
  @override
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  String value = "";

  DateTime selected;

  _showDateTimePicker() async {
    selected = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1960),
      lastDate: new DateTime(2050),
    );
  }

  GroupBtns memberGroupBtn;
  GroupBtns genderGroupBtn;
  GroupBtns gradeGroupBtn;

  int memberIndex = 0;
  int genderIndex = 0;
  int gradeIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var gap = 5.0;
    var btnSize = MediaQuery.of(context).size.width / 4.8 - (gap * 3);

    memberGroupBtn = GroupBtns(
      "Member",
      ["I'm a Student", "We're  a Team"],
      selectedIndex: memberIndex,
      btnSize: btnSize,
      setIndex: (index) {
        memberIndex = index;
      },
    );
    genderGroupBtn = GroupBtns(
      "Gender",
      ["Boy", "Girl"],
      selectedIndex: genderIndex,
      btnSize: btnSize,
      setIndex: (index) {
        genderIndex = index;
      },
    );
    gradeGroupBtn = GroupBtns(
      "Grade",
      ["2nd Grade", "3nd Grade", "4nd Grade", "5nd Grade", "6nd Grade"],
      selectedIndex: gradeIndex,
      btnSize: btnSize,
      setIndex: (index) {
        gradeIndex = index;
      },
    );

    var dateFormat_1 = selected != null
        ? new Text(
            DateFormat('yyyy-MMMM-dd').format(selected),
          )
        : new SizedBox(
            width: 0.0,
            height: 0.0,
          );

    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 243, 243, 1),
      body: Container(
          margin: EdgeInsets.only(left: 10, top: 20, right: 10),
          child: SingleChildScrollView(
              child: Column(children: [
            SizedBox(
              height: 30,
            ),
            Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(flex: 2, child: memberGroupBtn),
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(flex: 2, child: genderGroupBtn),
                ]),
            SizedBox(
              height: 20,
            ),
            gradeGroupBtn,
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(right: 350),
              child: Text(
                "Name",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter your name",
                ),
                onChanged: (String text) {
                  value = text;
                },
                onSubmitted: (String text) {
                  setState(() {
                    value = text;
                  });
                }),

            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(right: 290),
              child: Text(
                "Date of Birth",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            TextFormField(
              //enabled: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "When were you born",
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () {
                    _showDateTimePicker();
                  },
                ),
              ),
              // validator: (value) {
              //   if(value.isEmpty) {
              //     return 'Please enter some text';
              //   }

              // },
            ),

            // TextField(
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: "Where were you born",
            //     hintStyle: TextStyle(color: Colors.grey),
            //     suffixIcon: IconButton(
            //       icon: Icon(Icons.calendar_today),
            //       onPressed: () {
            //         _showDateTimePicker();
            //       },
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250,
              child: RaisedButton(
                onPressed: () {
                  var selectedText = memberGroupBtn.selectedText +
                      "\n" +
                      genderGroupBtn.selectedText +
                      "\n" +
                      gradeGroupBtn.selectedText +
                      "\n" +
                      value +
                      "\n" +
                      "$dateFormat_1";

                  print(selectedText);
                  //var dialog = PlatformAlertDialog(title: Text("Hello"));
                  showDialog(
                    context: context,
                    builder: (_) => PlatformAlertDialog(
                      //title: Text('Alert'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(memberGroupBtn.selectedText),
                          SizedBox(
                            height: 20,
                          ),
                          Text(genderGroupBtn.selectedText),
                          SizedBox(
                            height: 20,
                          ),
                          Text(gradeGroupBtn.selectedText),
                          SizedBox(
                            height: 20,
                          ),
                          Text("$value"),
                          SizedBox(
                            height: 20,
                          ),
                          dateFormat_1,
                        ],
                      ),
                      actions: <Widget>[
                        SizedBox(
                          height: 50,
                          child: Container(
                            padding: EdgeInsets.only(right: 40),
                            child: RaisedButton(
                              child: Stack(
                                children: <Widget>[
                                  Image.asset("images/button.png"),
                                  Positioned(
                                      left: 20,
                                      top: 11,
                                      right: 20,
                                      child: Text(
                                        "Close",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30),
                                        textAlign: TextAlign.center,
                                      ))
                                ],
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        )
                      ],
                      title: null,
                    ),
                  );
                },

                child: Stack(
                  children: <Widget>[
                    Image.asset("images/button.png"),
                    Positioned(
                        left: 20,
                        top: 11,
                        right: 20,
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),

                // child: Image.asset("images/button.png"),
              ),
            )
          ]))),
    );
  }
}
