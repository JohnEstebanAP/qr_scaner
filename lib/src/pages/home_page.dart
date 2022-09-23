import 'package:flutter/material.dart';
import 'package:qr_scaner/src/providers/scan_list_provider.dart';

import '../providers/db_provider.dart';
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
              onPressed: (){
                Provider.of<ScansListProvider>(context, listen: false).borrarTodos();
              },
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

    //option seleted
    int currentIndex = uiProvider.selectedMenuOpt;

    //Usar el ScanListProvider
    final scanListProvider = Provider.of<ScansListProvider>(context, listen:  false);

    switch( currentIndex){
      case 0:
        scanListProvider.cargarScansByTipe('geo');
        return const Mapaspage();
      case 1:
        scanListProvider.cargarScansByTipe('http');
        return const DireccionesPage();
      default:
        scanListProvider.cargarScansByTipe('geo');
        return const Mapaspage();
    }
  }
}
