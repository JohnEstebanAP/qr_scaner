import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scaner/src/utils/utils.dart';

import '../providers/scan_list_provider.dart';

class ScanTitles extends StatelessWidget {

  final String tipo;

  const ScanTitles({Key? key, required this.tipo}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final scanListProvider =
    Provider.of<ScansListProvider>(context, listen: true);
    final scans = scanListProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, index) => Dismissible(
          key: UniqueKey(),
          background: Container(
            color: Colors.red[200],
          ),
          onDismissed: (DismissDirection direction){
            Provider.of<ScansListProvider>(context, listen: false).borrarScanPorId(scans[index].id!);
          },
          child: ListTile(
            leading: Icon(
                (tipo == 'http')
                ?Icons.home
                :Icons.map,
                color: Theme.of(context).primaryColor),
            title: Text(scans[index].valor),
            subtitle: Text(scans[index].id.toString()),
            trailing:
            const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            onTap: () => launchURL(context, scans[index]),
          ),
        ));
  }
}
