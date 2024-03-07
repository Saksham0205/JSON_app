import 'package:flutter/material.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON App"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("local_json/person.json"),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                // Handle the case where data is null
                return CircularProgressIndicator(); // You can replace this with an appropriate widget or message
              }

              // Decode JSON
              var myData = json.decode(snapshot.data!.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Name : " + myData[index]['name']),
                        Text("age : " + myData[index]['age']),
                        Text("height : " + myData[index]['height']),
                        Text("branch : " + myData[index]['branch']),
                      ],
                    ),
                  );
                },
                itemCount: myData == null ? 0 : myData.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
