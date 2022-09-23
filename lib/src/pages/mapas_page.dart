import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scaner/src/widgets/scan_title.dart';

import '../providers/scan_list_provider.dart';

class Mapaspage extends StatelessWidget {
  const Mapaspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanTitles(tipo: 'http');
  }
}
