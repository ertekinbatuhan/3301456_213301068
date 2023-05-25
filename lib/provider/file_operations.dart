import 'package:flutter/material.dart';
import 'file_utils.dart';

class FileOperationsScreen extends StatefulWidget {
  FileOperationsScreen() : super();

  final String title = "Dosya Oku";

  @override
  _FileOperationsScreenState createState() => _FileOperationsScreenState();
}

class _FileOperationsScreenState extends State<FileOperationsScreen> {
  String fileContext = "Gelen veri Yok";
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: myController,
                decoration: InputDecoration(hintText: "Dosya ismi giriniz",border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(width: 200,
              child: ElevatedButton(
                child: Text("Kaydet"),
                onPressed: () {
                  FileUtils.saveToFile(myController.text);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(width: 200,
              child: ElevatedButton(
                child: Text("Oku"),
                onPressed: () {
                  FileUtils.readFromFile().then((context) {
                    setState(() {
                      fileContext = context;
                    });
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(fileContext,style: TextStyle(color: Colors.red, fontSize: 30.0)),
          ),
        ],
      ),
    );
  }
}