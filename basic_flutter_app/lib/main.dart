import 'package:flutter/material.dart';

import 'dog_card.dart';
import 'dog_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "We Rate Dogs",
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'We Rate Dogs'),
    );
  }
}

//MyHomePage is the stateful widget that instantiates the state. Not much else.
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key); // NEED TO FURTHER RESEARCH THIS BIT. NOT SURE WHAT IT IS DOING

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// This is where all the important stuff is happening for the card. Some initial dogs are set.
// and a widget which can get redraw is here. It references the dog_card.dart file.
// No logic is here in this state class.
class _MyHomePageState extends State<MyHomePage> {
  List<Dog> initalDoggos =
      [] //below is just adding some stock doggos to the app instead of cluttering the list.
        ..add(Dog('Ruby', 'Portland, OR, USA',
            'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
        ..add(Dog('Rex', 'Seattle, WA, USA', 'Best in Show 1999'))
        ..add(Dog('Rod Stewart', 'Prague, CZ',
            'Star good boy on international snooze team.'))
        ..add(Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
        ..add(
            Dog('Buddy', 'North Pole, Earth', 'Self proclaimed human lover.'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: DogCard(initalDoggos[1]),
      ),
    );
  }
}
