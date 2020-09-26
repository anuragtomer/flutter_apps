import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// Alternate to above 3 lines:
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // State<MyApp> connects this MyAppState back to MyApp class.
/**
 * State<> is a generic class. 
 * Whenever data is changed, MyApp can be recreated. But however, MyAppState is persistent. It is attached to MyApp.
 * MyAppState is not recreated whenever external data changes. Only MyApp is recreated.
 * */
  int questionIndex = 0; // Called property. class level variable.
  void answerQuestion() {
    // This indicates flutter to rerender UI. It by defaults does not rerender on every click because that's how it should be. It should not be rendering unnecessarily.
    // This setState is provided by State<>.
    // This takes an anonymous function which is responsible for updating the state.
    setState(() {
      questionIndex = (questionIndex+1) % 2;
    });
    print(questionIndex);
  }

  @override // Decorator provided by flutter sdk, not necessary but we do write this.
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          // Use Row instead if you want to have them next to each other instead of one below another.
          children: [
            Text(questions[
                questionIndex]), // This is the question text. Following would be the options for it.
            RaisedButton(
              child: Text('Answer 1'),
              // This needs to be a pointer to the function to be executed.
              // Adding braces would execute this function. We don't want that. We want to give the control to flutter when to execute the function.
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              // Anonymous function with just single line. Thus using a smaller version of writing function.
              onPressed: () => print('Answer 2 chosen.'),
            ),
            RaisedButton(
              child: Text('Answer 3'),
              // Again anonymous function but with multiple lines hence using another way of writing function.
              onPressed: () {
                print('Answer 3 chosen.');
                print('This is a longer function.');
              }, // Adding () here would execute this function here. We don't want that. We want to give control to flutter when to run this.
            ),
          ],
        ),
      ),
    );
  }
}
