import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var text = ["USD", "EUR", "AUD", "CAD", "MYR", "NZD", "IDR", "HKD", "BHD","IND"];
  int count = 9;  
  changetext(int textCount) {
    setState(() {
      count = textCount;
    });
  }

  TextEditingController input = TextEditingController();
  TextEditingController output = TextEditingController();

  void botton_pressed(String bottonText) {
    setState(() {
      changetext(count);
      output.text = "Please Enter Valid Number in";
      return;
    });
    switch (bottonText) {
      case "USD":
        output.text = ((double.parse(input.text)) * 71.10).toString(); 
        break;
      case "EUR":
        output.text = ((double.parse(input.text)) * 78.85).toString();
        break;
      case "AUD":
        output.text = ((double.parse(input.text)) * 48.64).toString();
        break;
      case "CAD":
        output.text = ((double.parse(input.text)) * 54.09).toString();
        break;
      case "MYR":
        output.text = ((double.parse(input.text)) * 17.49).toString();
        break;
      case "NZD":
        output.text = ((double.parse(input.text)) * 46.87).toString();
        break;
      case "IDR":
        output.text = ((double.parse(input.text)) * 0.0052).toString();
        break;
      case "HKD":
        output.text = ((double.parse(input.text)) * 9.149).toString();
        break;
      case "BHD":
        output.text = ((double.parse(input.text)) * 188.58).toString();
        break;
    }
  }

  Widget buildBotton(String bottonText, int i) {
    return MaterialButton(
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(12)),
      onPressed: () {
        botton_pressed(bottonText);
        changetext(i);
      },
      child: Text(
        bottonText,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      color: Colors.redAccent,
      splashColor: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Currency Converter",
      home: Scaffold(
        backgroundColor: Color(0xFF51008c),
        body: ListView(
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(90, 20, 0, 0),
                    padding: new EdgeInsets.only(top: 92.0),
                    child: Text(
                      "Currency Converter",
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(),
                    padding: EdgeInsets.all(25),
                    child: TextFormField(
                      controller: input,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        filled: true,
                        fillColor: Colors.grey,
                        labelText: "Amount  In INR",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          children: <Widget>[
                            Text(output.text,
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),


                            Text(" ${text[count]}",
                            style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),


                          ],
                        ),
                       )
                      ), 
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      buildBotton(text[0], 0),
                      buildBotton(text[1], 1),
                      buildBotton(text[2], 2),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      buildBotton(text[3], 3),
                      buildBotton(text[4], 4),
                      buildBotton(text[5], 5),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      buildBotton(text[6], 6),
                      buildBotton(text[7], 7),
                      buildBotton(text[8], 8),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
