import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_assignment/src/core/core.dart';
import 'package:map_assignment/src/features/map_display/presentations/cubit/map_display_cubit.dart';

class MapDisplayScreen extends StatefulWidget {
  final String filePath;

  const MapDisplayScreen({super.key, required this.filePath});

  @override
  State<MapDisplayScreen> createState() => _MapDisplayScreenState();
}

class _MapDisplayScreenState extends State<MapDisplayScreen> {
  final MapController _mapController = MapController();

  void _zoomIn(LatLng point) {
    _mapController.move(point, _mapController.camera.zoom + 1);
  }

  void _zoomOut(LatLng point) {
    _mapController.move(point, _mapController.camera.zoom - 1);
  }


  @override
  Widget build(BuildContext context) {
     final state = context.watch<MapDisplayCubit>().state;
     
    return Scaffold(
      appBar: AppBar(title: Text(context.tr.titleMapDisplay)),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              onTap: (tapPosition, point) {
                context.read<MapDisplayCubit>().updateLocation(point);
              },
              initialCenter: state.selectedLocation,
              initialZoom: 5.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',

                // urlTemplate: 'file://${widget.filePath}',
                // subdomains: [],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: state.selectedLocation,
                    child: const Icon(Icons.location_pin, color: Colors.red),
                  )
                ],
              ),
            ],
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: ()=> _zoomIn(state.selectedLocation),
                  heroTag: null,
                  child: const Icon(Icons.add),
                ),
                kSpaceVertical10,
                FloatingActionButton(
                  onPressed: ()=> _zoomOut(state.selectedLocation),
                  heroTag: null,
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AppRoutes.pinLocation);
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
