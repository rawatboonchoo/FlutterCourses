import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: GoogleMap(
        //ปักมุด markers รับข้อมูลเป็น Set
        markers: <Marker>[
          Marker(
              markerId: MarkerId('001'),
              position: LatLng(13.80564244, 100.574134),
              infoWindow:
                  InfoWindow(title: 'ทดสอบ', snippet: '55555', onTap: () {}))
        ].toSet(),
        //โชว์ google map ตาม LatLng(13.80564244, 100.574134)
        initialCameraPosition:
            CameraPosition(target: LatLng(13.80564244, 100.574134), zoom: 16),
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controler) {
          _controller.complete(controler);
        },
      ),
    );
  }
}
