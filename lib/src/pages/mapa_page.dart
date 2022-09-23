import 'package:flutter/material.dart';

import '../model/scan_model.dart';

class MapaPage extends StatelessWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final scan = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: Center(),

    );
  }
}
