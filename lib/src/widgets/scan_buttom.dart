import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scaner/src/pages/derecciones_page.dart';
import 'package:qr_scaner/src/providers/scan_list_provider.dart';
import 'package:qr_scaner/src/utils/utils.dart';

import '../pages/mapas_page.dart';
import '../providers/ui_provider.dart';

class ScanButtom extends StatelessWidget {
  const ScanButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Canselar', false, ScanMode.QR);
        //const String barcodeScanRes = '6.251794,-75.589275';

        if (barcodeScanRes == '-1') return;

        final scanListProvider =
            Provider.of<ScansListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

        //obtener el selected menu opt

        final uiProvider = Provider.of<UiProvider>(context, listen: false);
        int currentIndex = uiProvider.selectedMenuOpt;

        if (nuevoScan.tipo == 'http') {
          scanListProvider.cargarScansByTipe('http');
          uiProvider.selectedMenuOpt = 1;
        } else {
          scanListProvider.cargarScansByTipe('geo');
          uiProvider.selectedMenuOpt = 0;
        }
        //launchURL(context, nuevoScan);
      },
    );
  }
}
