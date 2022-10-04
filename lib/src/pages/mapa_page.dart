import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/scan_model.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    ScanModel? scan = ModalRoute.of(context)?.settings.arguments as ScanModel?;

    final CameraPosition puntoInecial = CameraPosition(
      target: scan!.getLatLng(),
      zoom: 17,
      tilt: 50,
    );

    //Marcadores
    Set<Marker> markers = new Set<Marker>();
    markers.add(new Marker(
      markerId: MarkerId('geo-location'),
      position: scan.getLatLng(),
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on_outlined),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller
                  .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                target: scan.getLatLng(),
                zoom: 17,
                tilt: 50,
              )));
            },
          ),
        ],
      ),
      body: GoogleMap(
        mapType: mapType,
        markers: markers,
        initialCameraPosition: puntoInecial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers),
        onPressed: (){
          if(mapType == MapType.normal){
            mapType = MapType.satellite;
          }else{
            mapType = MapType.normal;
          }
          setState(() {});

        },
      ),
    );
  }
}
