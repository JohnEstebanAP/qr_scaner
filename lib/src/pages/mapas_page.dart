import 'package:flutter/material.dart';

class Mapaspage extends StatelessWidget {
  const Mapaspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) => ListTile(
          leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
        )
    );
  }
}
