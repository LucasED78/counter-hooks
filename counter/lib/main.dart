import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Counter(),
  ));
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("$counter"),
            const SizedBox(height: 16,),
            RaisedButton(
              color: counter >= 50 ? Colors.teal : Colors.grey,
              child: Text(
                "PRESS",
                style: TextStyle(
                  color: counter >= 50 ? Colors.white : Colors.black
                ),
              ),
              onPressed: (){
                setState(() => counter++);
              },
            ),
            AnimatedOpacity(
              opacity: counter >= 50 ? 1 : 0,
              duration: Duration(milliseconds: 500),
              child: RaisedButton(
                color: Colors.grey[100],
                child: Text(
                  "RESET :(",
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
                onPressed: (){
                  setState(() => counter = 0);
                },
              ),
            ),
            const SizedBox(height: 16,),
            AnimatedOpacity(
              opacity: counter >= 50 ? 1 : 0,
              duration: Duration(milliseconds: 500),
              child: Text("Nossa! Você já atingiu mais de $counter contagens!!"),
            )
          ],
        ),
      ),
    );
  }
}