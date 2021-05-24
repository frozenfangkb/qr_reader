import 'package:flutter/cupertino.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  final url = scan.value;

  if (scan.type == 'http') {
    await launch(url);
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
