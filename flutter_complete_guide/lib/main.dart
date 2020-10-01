import 'package:flutter/material.dart';
import './question.dart';

import './answer.dart';
// void main() {
//   runApp(MyApp());
// }

// Alternate to above 3 lines:
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// _ tells this this is a private class.
class _MyAppState extends State<MyApp> {
  // State<MyApp> connects this MyAppState back to MyApp class.
/**
 * State<> is a generic class. 
 * Whenever data is changed, MyApp can be recreated. But however, MyAppState is persistent. It is attached to MyApp.
 * MyAppState is not recreated whenever external data changes. Only MyApp is recreated.
 * */
  int _questionIndex = 0; // Called property. class level variable.
  void _answerQuestion() {
    // This indicates flutter to rerender UI. It by defaults does not rerender on every click because that's how it should be. It should not be rendering unnecessarily.
    // This setState is provided by State<>.
    // This takes an anonymous function which is responsible for updating the state.
    setState(() {
      _questionIndex = (_questionIndex + 1) % 2;
    });
  }

  @override // Decorator provided by flutter sdk, not necessary but we do write this.
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answerText': ['Red', 'Blue', 'Green', 'Others']
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answerText': ['Rabbit', 'Pig', 'Leopard', 'Gadha', 'You']
      }
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          // Use Row instead if you want to have them next to each other instead of one below another.
          children: [
            Question(questions[_questionIndex][
                'questionText']), // This is the question text. Following would be the options for it.
            ...(questions[_questionIndex]['answerText'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList(),
            // ... takes a list, and expand it to match what is in the parent object.
            // So here, it takes a list and adds it to childred as individual elements.
          ],
        ),
      ),
    );
  }
}
// General convention is that have only one widget per file. Only if the two
// widgets work together, then you can have 2 widgets in the same file.
