import 'package:flutter/material.dart';

import '../providers/ui_provider.dart';
import '../widgets/custom_navigatorbar.dart';
import '../widgets/scan_buttom.dart';
import 'package:provider/provider.dart';

import 'derecciones_page.dart';
import 'mapas_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),

      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: ScanButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    //obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    //TODO: Temporal leer la base de datos
    //DBProvider.db.database;

    //option seleted
    int currentIndex = uiProvider.selectedMenuOpt;

    switch( currentIndex){
      case 0:
        return const Mapaspage();
      case 1:
        return const DireccionesPage();
      default:
        return const Mapaspage();
    }
  }
}
