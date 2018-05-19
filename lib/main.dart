import 'package:flutter/material.dart';

void main(){
  runApp(
    new MaterialApp(
      home: new Home(),
    )
  );
}

class Home extends StatelessWidget{
  var words = ["noun", "verb", "adjective", "adverb"];

  List tfs = [];
  List cont = [];
  TextEditingController noun = new TextEditingController();
  TextEditingController verb = new TextEditingController();
  TextEditingController adjective = new TextEditingController();
  TextEditingController adverb = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    cont.add(noun);
    cont.add(verb);
    cont.add(adjective);
    cont.add(adverb);

    for(int i = 0 ; i < words.length; i++){
      tfs.add(new TextField(
        controller: cont[i],
        decoration: new InputDecoration(labelText: "Enter a " + words[i].toString()),
      ));
    }
    RaisedButton raisedButton = new RaisedButton(
        child: new Text("Add Mad Lib"),
        onPressed: (){
            AlertDialog dialog = new AlertDialog(
              content: new Text("Do you " + cont[1].text.toString() + " your " + cont[2].text.toString() +
              " " + cont[0].text.toString() + " " + cont[3].text.toString()+ "?  That's hilarious!"),
            );
            showDialog(context: context, child: dialog);
    });
    Container container = new Container(
      child: new Column(
        children: <Widget>[
          tfs[0], tfs[1], tfs[2], tfs[3], raisedButton,
        ],
      )
    );
    AppBar appBar = new AppBar(
      title: new Text("Enter the info"),);
    Scaffold scaffold = new Scaffold(appBar: appBar, body: container);
    return scaffold;
  }
}