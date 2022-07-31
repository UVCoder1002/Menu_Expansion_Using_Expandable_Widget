import 'package:expandable_medium/dataModel.dart';
import 'package:expandable_medium/expansionChipList.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<DataModel> productNameList = [];
    productNameList.add(DataModel(id: "DM1", name: "ToothPaste"));
    productNameList.add(DataModel(id: "DM2", name: "Soap", quantity: 5));
    productNameList.add(DataModel(id: "DM3", name: "Shampoo", quantity: 7));
    productNameList.add(DataModel(id: "DM4", name: "Hair Conditioner"));
    productNameList.add(DataModel(id: "DM5", name: "Face Wash"));
    productNameList.add(DataModel(id: "DM6", name: "Face Scrub"));
    productNameList.add(DataModel(id: "DM7", name: "Body Lotion"));
    productNameList.add(DataModel(id: "DM8", name: "Perfume"));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Expansion Chip List', style: TextStyle(fontSize: 20.0)),
            SizedBox(
              height: 20.0,
            ),
            ExpansionChipList<DataModel>(
              name: "name",
              listOfObj: productNameList,
            ),
          ],
        ),
      ),
    );
  }
}
