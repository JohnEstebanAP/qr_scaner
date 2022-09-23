import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scaner/src/providers/scan_list_provider.dart';

class ScanButtom extends StatelessWidget {
  const ScanButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async{
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Canselar', false, ScanMode.QR);
        const String barcodeScanRes = 'https://eaeaoeaoe';

        final scanListProvider = Provider.of<ScansListProvider>(context, listen: false);
        scanListProvider.nuevoScan(barcodeScanRes);

        scanListProvider.nuevoScan('geo:15.83,15.66');
      },
    );
  }
}
