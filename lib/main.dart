import 'package:flutter/material.dart';
import 'package:share/share.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: firstpage());
  }
}

class firstpage extends StatefulWidget {
  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  int currentindex = 0;
  String result = "";
  TextEditingController hightcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Title(
          color: Colors.white,
          child: Center(
            child: Text(
              "Bmi Calculator",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  radioButton("Man", Colors.blue, 1),
                  radioButton("Woman", Colors.pink, 2),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Your Height in cm ",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: hightcontroller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Height(cm)",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Your weight in Kg ",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: weightcontroller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Weight(Kg) ",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: TextButton(
                    onPressed: () {
                      double h = double.parse(hightcontroller.value.text);
                      double w = double.parse(weightcontroller.value.text);
                      caluculatebmi(h, w);
                    },
                    child: Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              Text("Your BMI is :",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20.0,
              ),
              Text(
                result,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeindex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  void caluculatebmi(double h, double w) {
    double finalresult = w/(h*h/10000);
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
        child: Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      child: TextButton(
        onPressed: () {
          changeindex(index);
        },
        child: Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: currentindex == index ? Colors.white : color,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: currentindex == index ? color : Colors.grey[100],
      ),
    ));
  }
}
