import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';


class Invoice extends StatelessWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice'),
        actions: [
          IconButton(
            icon: Icon(Icons.picture_as_pdf),
            onPressed: () async {
              final pdfBytes = await generatePdf();
              Printing.layoutPdf(
                  onLayout: (PdfPageFormat format) async => pdfBytes);
            },
          ),
        ],
      ),
      body: InvoiceContent(),
    );
  }

  Future<Uint8List> generatePdf() async {
    final pdf = pw.Document();
    final image = await imageFromAssetBundle('assets/images/ORKUT DESIGN.jpg');

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  children: [
                    pw.Image(pw.MemoryImage(image), width: 140),
                    pw.SizedBox(width: 100),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('INVOICE',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 24)),
                        pw.SizedBox(height: 10),
                        pw.Text('DATE: 2024-05-18',
                            style: pw.TextStyle(fontSize: 14)),
                        pw.Text('#INVOICE: 123456',
                            style: pw.TextStyle(fontSize: 14)),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Row(
                  children: [
                    pw.Container(
                      padding: pw.EdgeInsets.all(5),
                      color: PdfColors.black,
                      child: pw.Text('BILL TO',
                          style: pw.TextStyle(
                              color: PdfColors.white, fontSize: 15)),
                    ),
                    pw.SizedBox(width: 50),
                    pw.Text('PRODUCT :', style: pw.TextStyle(fontSize: 15)),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Name :'),
                    pw.Text('Phone :'),
                    pw.Text('Address :'),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Table(
                  border: pw.TableBorder.all(),
                  children: [
                    pw.TableRow(children: [
                      pw.Container(
                        color: PdfColors.black,
                        child: pw.Text('S/N',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(color: PdfColors.white)),
                      ),
                      pw.Container(
                        color: PdfColors.black,
                        child: pw.Text('ITEM',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(color: PdfColors.white)),
                      ),
                      pw.Container(
                        color: PdfColors.black,
                        child: pw.Text('AMOUNT',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(color: PdfColors.white)),
                      ),
                    ]),
                    for (int i = 1; i <= 5; i++)
                      pw.TableRow(children: [
                        pw.Container(
                            child:
                                pw.Text('$i', textAlign: pw.TextAlign.center)),
                        pw.Container(
                            child: pw.Text('Item $i',
                                textAlign: pw.TextAlign.center)),
                        pw.Container(
                            child:
                                pw.Text('100', textAlign: pw.TextAlign.center)),
                      ]),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  children: [
                    pw.Container(
                      width: 200,
                      height: 100,
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Container(
                            width: double.infinity,
                            color: PdfColors.grey,
                            padding: pw.EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            child: pw.Text('Comments',
                                style: pw.TextStyle(color: PdfColors.black)),
                          ),
                        ],
                      ),
                    ),
                    pw.Spacer(),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                          children: [
                            pw.Container(width: 70, child: pw.Text('subtotal')),
                            pw.Container(
                                width: 95,
                                color: PdfColor.fromInt(0xffdfdfdf),
                                child: pw.Text('500')),
                          ],
                        ),
                        pw.Row(
                          children: [
                            pw.Container(width: 70, child: pw.Text('tax')),
                            pw.Container(
                                width: 95,
                                color: PdfColor.fromInt(0xfffafafa),
                                child: pw.Text('50')),
                          ],
                        ),
                        pw.Row(
                          children: [
                            pw.Container(width: 70, child: pw.Text('other')),
                            pw.Container(
                                width: 95,
                                color: PdfColor.fromInt(0xffdfdfdf),
                                child: pw.Text('10')),
                          ],
                        ),
                        pw.SizedBox(height: 5),
                        pw.Container(
                            height: 1, width: 165, color: PdfColors.black),
                        pw.SizedBox(height: 5),
                        pw.Row(
                          children: [
                            pw.Container(
                              width: 70,
                              child: pw.Text('TOTAL',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold)),
                            ),
                            pw.Container(
                                width: 95,
                                color: PdfColor.fromInt(0xfffafafa),
                                child: pw.Text('560')),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 60),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('THANK YOU'),
                    pw.Text('(Authorized Signatory)'),
                  ],
                ),
                pw.SizedBox(height: 60),
                pw.Container(
                  width: double.infinity,
                  height: 30,
                  color: PdfColors.black,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.Text('Phone: 9020718126',
                          style: pw.TextStyle(color: PdfColors.white)),
                      pw.Container(
                          height: 10, width: 1, color: PdfColors.white),
                      pw.Text('Gmail: orkutitsolutions@gmail.com',
                          style: pw.TextStyle(color: PdfColors.white)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    return pdf.save();
  }

  Future<Uint8List> imageFromAssetBundle(String path) async {
    final ByteData data = await rootBundle.load(path);
    return data.buffer.asUint8List();
  }
}

class InvoiceContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 10),
      color: Colors.white,
      height: 842,
      width: 700,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/ORKUT DESIGN.jpg',
                width: width * 0.20,
              ),
              SizedBox(width: width * 0.15),
              Container(
                // color: Colors.yellowAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('INVOICE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.02)),
                    Row(
                      // Changed Row to Text for single line
                      children: [
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Text('DATE: ',
                            style: TextStyle(
                                fontSize: 13)), // Added space after colon
                      ],
                    ),
                    Row(
                      // Changed Row to Text for single line
                      children: [
                        Text('#INVOICE: ',
                            style: TextStyle(
                                fontSize: 13)), // Added space after colon
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.02,
              ),
              Container(
                height: 25,
                width: width * 0.12,
                // color: Color(0xff374473),
                color: Colors.black,
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Text(
                      'BILL TO',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.18,
              ),
              Text(
                'PRODUCT :',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: width * 0.03,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text('Name :'),
                  SizedBox(
                    height: height * 0.003,
                  ),
                  Text('Phone :'),
                  SizedBox(
                    height: height * 0.003,
                  ),
                  Text('Address :'),
                  SizedBox(
                    height: height * 0.003,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1)),
                width: width * 0.41,
                height: 160,
                child: Table(
                  columnWidths: {
                    0: FixedColumnWidth(80.0),
                    1: FlexColumnWidth(20.0),
                    2: FixedColumnWidth(100.0),
                  },
                  border: TableBorder.symmetric(
                      inside: BorderSide(width: 1, color: Colors.black)),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      children: [
                        Container(
                            height: 30,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                "S/N",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                        Container(
                            height: 30,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                "ITEM",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                        Container(
                            height: 30,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                "AMOUNT",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                    for (int i = 1; i <= 5; i++)
                      TableRow(
                        children: [
                          Container(
                              height: 25, child: Center(child: Text("$i"))),
                          Container(
                              height: 25,
                              child: Center(child: Text("Item $i"))),
                          Container(
                              height: 25, child: Center(child: Text("100"))),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            children: [
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: width * 0.02, vertical: 5),
                width: width * 0.2,
                height: height * 0.18,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(
                  children: [
                    Container(
                      width: width * 0.2,
                      height: 25,
                      color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Comments',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Container()
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.08,
              ),
              Container(
                height: 150,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 70, child: Center(child: Text('subtotal'))),
                        Container(
                            width: 95,
                            color: Color(0xffdfdfdf),
                            child: Center(child: Text('500'))),
                      ],
                    ),
                    Row(
                      children: [
                        Container(width: 70, child: Center(child: Text('tax'))),
                        Container(
                            width: 95,
                            color: Color(0xfffafafa),
                            child: Center(child: Text('50'))),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            width: 70, child: Center(child: Text('other'))),
                        Container(
                            width: 95,
                            color: Color(0xffdfdfdf),
                            child: Center(child: Text('10'))),
                      ],
                    ),
                    SizedBox(height: 5),
                    Container(height: 1, width: 165, color: Colors.black),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          width: 70,
                          child: Center(
                            child: Text(
                              'TOTAL',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                            width: 95,
                            color: Color(0xfffafafa),
                            child: Center(child: Text('560'))),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 60),
          Row(
            children: [
              SizedBox(width: 30),
              Text('THANK YOU'),
              Spacer(),
              Text('(Authorized Signatory)'),
              SizedBox(width: 30),
            ],
          ),
          SizedBox(height: 60),
          Container(
            width: width,
            height: 30,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 30),
                Text('Phone: 9020718126',
                    style: TextStyle(color: Colors.white)),
                Container(height: 10, width: 1, color: Colors.white),
                Text('Gmail: orkutitsolutions@gmail.com',
                    style: TextStyle(color: Colors.white)),
                SizedBox(width: 30),
              ],
            ),
          )
        ],
      ),
    );
  }
}
