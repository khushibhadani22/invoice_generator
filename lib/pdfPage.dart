import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'Global.dart';

class PDF extends StatefulWidget {
  const PDF({Key? key}) : super(key: key);

  @override
  State<PDF> createState() => _PDFState();
}

class _PDFState extends State<PDF> {
  late List<dynamic> dataB;
  final pdf = pw.Document();
  @override
  void initState() {
    super.initState();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text(
                "Fashion & Beauty",
                style:
                    pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 20),
              ),
              pw.Divider(
                thickness: 8,
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    "Product Name",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 15),
                  ),
                  pw.SizedBox(width: 100),
                  pw.Text(
                    "Quantity",
                    style: pw.TextStyle(
                        fontSize: 15, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    "price",
                    style: pw.TextStyle(
                        fontSize: 15, fontWeight: pw.FontWeight.bold),
                  ),
                ],
              ),
              pw.Divider(
                thickness: 8,
              ),
              pw.Column(
                children: dataB
                    .map(
                      (e) => pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            "${e['name']}",
                            style: const pw.TextStyle(fontSize: 15),
                          ),
                          pw.SizedBox(width: 100),
                          pw.Text(
                            "${e['i']}",
                            style: const pw.TextStyle(fontSize: 15),
                          ),
                          pw.Text(
                            "  ${e['price']}",
                            style: const pw.TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              pw.Divider(
                thickness: 8,
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    "Total",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 15),
                  ),
                  pw.Text(
                    "${Global.totalBill}",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
              pw.Divider(
                thickness: 8,
              ),
            ],
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    dataB = Global.finalCart;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Fashion & Beauty",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Divider(
            thickness: 8,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Product Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                width: 100,
              ),
              Text(
                "Quantity",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                "price",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(
            thickness: 8,
            color: Colors.black,
          ),
          Column(
            children: Global.finalCart
                .map(
                  (e) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${e['name']}",
                        style: const TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        "${e['i']}",
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        "  ${e['price']}",
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
          const Divider(
            thickness: 8,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                "${Global.totalBill}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          const Divider(
            thickness: 8,
            color: Colors.black,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey.shade900,
        onPressed: () async {
          Directory? tempDir = await getExternalStorageDirectory();
          File locate = File('${tempDir!.path}/invoice.pdf');
          await locate.writeAsBytes(await pdf.save());
        },
        child: const Icon(
          Icons.download,
          color: Colors.white,
        ),
      ),
    );
  }
}
