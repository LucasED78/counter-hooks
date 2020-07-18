import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(MaterialApp(
    home: Counter(),
  ));
}

class Counter extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // cria uma variável que será atualizada sempre que
    // seu valor for modificado
    final counter = useState(0);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("${counter.value}"),
            const SizedBox(height: 16,),
            RaisedButton(
              color: counter.value >= 50 ? Colors.teal : Colors.grey,
              child: Text(
                "PRESS",
                style: TextStyle(
                  color: counter.value >= 50 ? Colors.white : Colors.black
                ),
              ),
              onPressed: () {
                // modificando o value do contador, atualiza a variável
                counter.value++;
              }
            ),
            AnimatedOpacity(
              opacity: counter.value > 0 ? 1 : 0,
              duration: Duration(milliseconds: 500),
              child: RaisedButton(
                color: Colors.grey[100],
                child: Text(
                  "RESET :(",
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
                onPressed: () => counter.value = 0
              ),
            ),
            const SizedBox(height: 16,),
            AnimatedOpacity(
              opacity: counter.value >= 50 ? 1 : 0,
              duration: Duration(milliseconds: 500),
              child: Text("Nossa! Você já atingiu mais de ${counter.value} contagens!!"),
            )
          ],
        ),
      ),
    );
  }
}