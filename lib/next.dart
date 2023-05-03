import 'package:flutter/material.dart';

class Next extends StatefulWidget {
  final color;

  Next({required this.color});

  @override
  NextState createState() => NextState();

}

class NextState extends State<Next> {

  bool  showApp = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (showApp) ? AppBar(
          title: Text('Nouvelle page'),
          backgroundColor: widget.color,
        ): null,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(onPressed: () {
                setState(() {
                  showApp = !showApp;
                });
              }, child: Text((showApp) ? "Cacher" : "Montrer")),
              ElevatedButton(onPressed: (() => Navigator.of(context).pop()), child: Text("Retour")),
            ],
          ),
        )
    );
  }


}