import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await SentryFlutter.init(
    (options) => options.dsn =
        'https://e5c64500c19d4d9a8ab70439a4b22efb@o4507061658386432.ingest.us.sentry.io/4507061684273154',
    appRunner: () => runApp(MyApp()),
  );
}

class MyApp extends StatelessWidget {
  TextEditingController textField1Controller = TextEditingController();
  TextEditingController textField2Controller = TextEditingController();
  int uDiff = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.amber,
        ),
        home: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text('Flutter Sentry Demo',
                  style: TextStyle(fontSize: 25), textAlign: TextAlign.left),
              centerTitle: true,
            ),
            body: Center(
              child: ListView(children: <Widget>[
                Container(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: textField1Controller,
                    autofocus: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Text input 1',
                      hintText: 'Enter number',
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: textField2Controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Text input 2',
                      hintText: 'Enter number',
                    ),
                  ),
                ),
                Container(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 50,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text('Result : $uDiff',
                              style: const TextStyle(fontSize: 15),
                              textAlign: TextAlign.left),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(
                    children: [
                      Container(
                          width: 190,
                          height: 35,
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber),
                            child: const Text('Calculate',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center),
                            onPressed: () {
                              try {
                                int text1 = int.parse(textField1Controller.text);
                                int text2 = int.parse(textField2Controller.text);
                                uDiff = (text1 ~/ text2);
                              } catch (error) {
                                throw StateError('This is event onPressed exception error.$error');
                              }
                            },
                          )),
                    ],
                  ),
                ])
              ]),
            )));
  }
}
