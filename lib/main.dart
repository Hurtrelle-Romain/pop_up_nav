import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pop  Up et Nav'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

Color btnColor = Colors.greenAccent;
Color appBarColor = Colors.lightBlueAccent;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: appBarColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             ElevatedButton(
                onPressed: () {
                    AlertDialog alert = AlertDialog(
                    title: const Text("Ma première alerte"),
                    content: const Text("J'ai crée ma première alerte"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Ok")),
                      TextButton(onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          appBarColor = (appBarColor == Colors.lightBlueAccent)
                              ? Colors.lightGreenAccent
                              : Colors.lightBlueAccent;
                        });
                      },
                          child: Text("Changer le AppBar")),
                    ],
                  );
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (BuildContext ctx) {
                        return alert;
                      });
                },
                child: const Text("Montrer une alerte"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: btnColor,
        onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(createSnack(text: 'Snack évoluée'));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  SnackBar createSnack({required String text})   {
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.house),
        Text(text)
      ],
    );
    final snack = SnackBar(
        action: SnackBarAction(
          label: "changer couleur bouton",
          onPressed: () {
            setState(() {
            btnColor = (btnColor == Colors.greenAccent) ? Colors.redAccent :  Colors.greenAccent;
            });
          },
          textColor: Colors.red,
        ),
        backgroundColor: Colors.greenAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 8,
        behavior: SnackBarBehavior.floating,
        content: content);
    return snack;

  }
}
