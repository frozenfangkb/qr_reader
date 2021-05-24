import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedType = 'http';

  Future<ScanModel> newScan(String value) async {
    final newScan = new ScanModel(value: value);
    final id = await DBProvider.db.newScan(newScan);
    newScan.id = id;
    if (this.selectedType == newScan.type) {
      this.scans.add(newScan);
      notifyListeners();
    }

    return newScan;
  }

  loadScans() async {
    final scans = await DBProvider.db.getAllScans();

    this.scans = [...scans];
    notifyListeners();
  }

  loadScansByType(String type) async {
    final scans = await DBProvider.db.getScansByType(type);

    this.selectedType = type;
    this.scans = [...scans];
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  deleteById(int id) async {
    await DBProvider.db.deleteScan(id);
    await this.loadScansByType(selectedType);
  }
}
