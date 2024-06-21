import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQrCodeState extends StatefulWidget {
  const ScanQrCodeState({super.key});

  @override
  State<ScanQrCodeState> createState() => _ScanQrCodeStateState();
}

class _ScanQrCodeStateState extends State<ScanQrCodeState> {
  String qrResult = 'Scanned Data will appear here';

  Future<void> scanQR() async {
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'cancel', true, ScanMode.QR);
      if(!mounted) return;
      setState(() {
        this.qrResult = qrCode.toString();
      });
    } on PlatformException{
      qrResult = 'Failed to Scanned Data';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(qrResult),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: scanQR, child: const Text('Scan QR Code'))
          ],
        ),
      ),
    );
  }
}

