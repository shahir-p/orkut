import 'package:flutter/material.dart';

class Invoice extends StatelessWidget {
  const Invoice({super.key});

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
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
                  width: Width * 0.20,
                ),
                SizedBox(width: Width * 0.15),
                Container(
                  // color: Colors.yellowAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('INVOICE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Width * 0.02)),
                      Row(
                        // Changed Row to Text for single line
                        children: [
                          SizedBox(
                            width: Width * 0.02,
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
              height: Height * 0.02,
            ),
            Row(
              children: [
                SizedBox(
                  width: Width * 0.02,
                ),
                Container(
                  height:25,
                  width: Width * 0.12,
                  // color: Color(0xff374473),
                  color: Colors.black,
                  child: Row(
                    children: [
                      SizedBox(
                        width: Width * 0.01,
                      ),
                      Text(
                        'BILL TO',
                        style: TextStyle(color: Colors.white,fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Width * 0.18,
                ),
                Text(
                  'PRODUCT :',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: Width * 0.03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Text('Name :'),
                    SizedBox(
                      height: Height * 0.003,
                    ),
                    Text('Phone :'),
                    SizedBox(
                      height: Height * 0.003,
                    ),
                    Text('Address :'),
                    SizedBox(
                      height: Height * 0.003,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: Height * 0.03,
            ),
            Row(
              children: [
                SizedBox(
                  width: Width * 0.02,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          right: BorderSide(width: 1, color: Colors.black),
                          top: BorderSide(width: 1, color: Colors.black),
                          bottom: BorderSide(width: 1, color: Colors.black),
                          left: BorderSide(width: 1, color: Colors.black))),
                  width: Width * 0.41,
                  height: 160,

                  // Adjust background color as needed
                  child: Table(
                    columnWidths: {
                      0: FixedColumnWidth(
                          80.0), // First column with 10.0 units width
                      1: FlexColumnWidth(
                          20.0), // Second column with 20.0 units width
                      2: FixedColumnWidth(
                          100.0), // Third column with 10.0 units width
                    },
                    border: TableBorder(
                        verticalInside: BorderSide(
                            width: 1,
                            color: Colors.black,
                            style: BorderStyle.solid)),
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
                      TableRow(
                        children: [
                          Container(height: 25,child: Center(child: Text("1"))),
                          Container(height: 25,child: Center(child: Text("1"))),
                          Container(height: 25,child: Center(child: Text("1"))),
                        ],
                      ),
                      TableRow(
                        children: [
                          Container(height: 25,child: Center(child: Text("1"))),
                          Container(height: 25,child: Center(child: Text("1"))),
                          Container(height: 25,child: Center(child: Text("1"))),
                        ],
                      ),
                      TableRow(
                        children: [
                          Container(height: 25,child: Center(child: Text("1"))),
                          Container(height: 25,child: Center(child: Text("1"))),
                          Container(height: 25,child: Center(child: Text("1"))),
                        ],
                      ),
                      TableRow(
                        children: [
                          Container(height: 25,child: Center(child: Text("1"))),
                          Container(height: 25,child: Center(child: Text("1"))),
                          Container(height: 25,child: Center(child: Text("1"))),
                        ],
                      ),
                      TableRow(
                        children: [
                          Container(height: 25,child: Center(child: Text("1"))),
                          Container(height: 25,child: Center(child: Text("1"))),
                          Container(height: 25,child: Center(child: Text("1"))),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Height * 0.01,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Width * 0.02, vertical: 5),
                  width: Width * 0.2,
                  height: Height * 0.18,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: Width * 0.2,
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
                  width: Width * 0.08,
                ),
                Container(
                  height: 150,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 70,
                              child: Center(child: Text('subtotal'))),
                          Container(
                              width: 95,
                              color: Color(0xffdfdfdf),
                              child: Center(child: Text('00'))),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              width: 70, child: Center(child: Text('tax'))),
                          Container(
                              width: 95,
                              color: Color(0xfffafafa),
                              child: Center(child: Text('00'))),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              width: 70,
                              child: Center(child: Text('other'))),
                          Container(
                              width: 95,
                              color: Color(0xffdfdfdf),
                              child: Center(child: Text('00'))),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Container(height: 1,
                      width: 165,
                      color: Colors.black,),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Container(
                              width: 70,
                              child: Center(
                                  child: Text(
                                'TOTAL',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))),
                          Container(
                              width: 95,
                              color: Color(0xfffafafa),
                              child: Center(child: Text('00'))),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 60,),
            Row(
              children: [
                SizedBox(width: 30,),
                Text('THANK YOU'),
                Spacer(),
                Text('(Authorized Signatory)'),
                SizedBox(width: 30,),
              ],
            ),
            SizedBox(height: 60,),
            Container(
              width: Width,
              height: 30,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 30,),
                  Text('Phone: 9020718126',style: TextStyle(color: Colors.white),),
                  Container(
                    height: 10,
                    width: 1,
                    color: Colors.white,
                  ),
                  Text('Gmail: orkutitsolutions@gmail.com',style: TextStyle(color: Colors.white),),
                  SizedBox(width: 30,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
