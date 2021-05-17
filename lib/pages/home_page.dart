import 'package:flutter/material.dart';
import 'package:qr_reader/pages/directions_history.dart';
import 'package:qr_reader/pages/maps_history.dart';
import 'package:qr_reader/widgets/custom_navigator_bar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentIndex = 0;

    switch (currentIndex) {
      case 0:
        return MapsHistoryPage();
      case 1:
        return DirectionsHistoryPage();
      default:
        return MapsHistoryPage();
    }
  }
}
