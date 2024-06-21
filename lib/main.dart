import 'package:flutter/material.dart';
import 'package:qrscanner/generate_qr_code.dart';
import 'package:qrscanner/scan_qr_code.dart';
import 'package:qrscanner/translator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'QR code Scanner and Generator',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScanQrCodeState()));
                  });
                },
                child: const Text("Scan QR Code")),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GenerateQrCodeState()));
                  });
                },
                child: const Text("Generate QR Code")),
            const SizedBox(height: 40),
            ElevatedButton(onPressed: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Translator()));
              });
            }, child: const Text('Translator')),
          ],
        ),
      ),
    );
  }
}
