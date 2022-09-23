import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/scan_model.dart';

Future<void> launchURL(BuildContext context, ScanModel scan) async {
  final url = scan.valor;
  final Uri _url = Uri.parse('https://flutter.dev');
  /*
  if (scan.tipo == 'http') {
    //abrir el sitio web
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }else {
    print('geo!!');
  }*/
  if (scan.tipo == 'http') {
    //abrir el sitio web
    if (await canLaunch(url)) {
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
  }else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
