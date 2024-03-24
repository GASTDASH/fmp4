import 'package:flutter/material.dart';
import 'package:fmp4/screens/reg_screen.dart';
import 'package:fmp4/widgets/appbar.dart';
import 'package:pdfx/pdfx.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  final pdfControllerPinch = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/pdf/privacy.pdf'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: my_appbar(
          backButton: true,
          onPressedBack: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => RegScreen()));
          },
          title: "Privacy policy"),
      body: Column(
        children: [
          Expanded(child: PdfViewPinch(controller: pdfControllerPinch))
        ],
      ),
    );
  }
}
