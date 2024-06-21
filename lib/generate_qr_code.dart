import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCodeState extends StatefulWidget {
  const GenerateQrCodeState({super.key});

  @override
  State<GenerateQrCodeState> createState() => _GenerateQrCodeStateState();
}

class _GenerateQrCodeStateState extends State<GenerateQrCodeState> {
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate QR Code"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              if(urlController.text.isNotEmpty)
                QrImageView(data : urlController.text,size: 200),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: urlController,
                  decoration: InputDecoration(
                    hintText: 'Enter your data',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    labelText: 'Enter your data'
                  ),
                ),
              ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () {
              setState(() {

              });
            }, child: const Text('Generate QR Code'))
          ],
        ),
      ),
    );
  }
}

