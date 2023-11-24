import 'package:exam_shared_prefernce/utils/database/db.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final int itemIndex;

  const DetailScreen({super.key, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              places[itemIndex]['name'],
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            )),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 200,
              child: Image.network(places[itemIndex]['image']),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                places[itemIndex]['description'],
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.justify,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
