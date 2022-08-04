import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:name_the_project/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Glossary? glossary;

  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  void _loadJson() async {
    final model = await DefaultAssetBundle.of(context).loadString('assets/myJson.json');
    final jsonResult = jsonDecode(model);
    debugPrint(jsonResult['glossary']['title']);
    setState(() {
      glossary = Glossary.fromJson(jsonResult['glossary']);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (glossary == null) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'glossary: ${glossary!.title}',
            ),
            Text(
              'title: ${glossary!.glossDiv.title}',
            ),
            Text(
              'glossList: ${glossary!.glossDiv.glossList}',
            ),
          ],
        ),
      ),
    );
  }
}
