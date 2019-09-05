import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MapsPage extends StatefulWidget {

  @override
  MapsPageState createState() => MapsPageState();
  
}

class MapsPageState extends State<MapsPage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }
  double zoomVal = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () {
            //
          }),
          title: Text("Mapa"),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {
                //
              }),
          ],
      ),
      body: Stack(
        children: <Widget>[
          _googlemap(context)
        ],
      ),
    );
  }

  Widget _googlemap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target: LatLng(4.648532, -74.061248), zoom: 12),
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
        markers: {
          bogota1Marker
        },
      )
    );
  }
}

Marker bogota1Marker=Marker(
  markerId: MarkerId('bogota1'),
  position: LatLng(4.648532, -74.061248),
  infoWindow: InfoWindow(title: 'Konrad Lorenz'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  )
);