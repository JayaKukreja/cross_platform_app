import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfApp extends StatefulWidget {
  const PdfApp({super.key});

  @override
  State<PdfApp> createState() => _PdfAppState();
}

class _PdfAppState extends State<PdfApp> {
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    secure();
  }

  secure() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfPdfViewer.asset('assets/example.pdf'));
  }
}
