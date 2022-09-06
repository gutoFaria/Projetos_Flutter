import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsPage extends StatefulWidget {
  final String bill;
  final String tax;
  final double friends;
  final double tip;
  ResultsPage(this.bill, this.tax, this.friends, this.tip);
  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  String dividedamount = '';
  @override
  void initState() {
    super.initState();
    divideamount();
  }

  TextStyle infostyle = GoogleFonts.montserrat(
      fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700);

  divideamount() {
    double taxamount =
        double.parse(widget.bill) * (double.parse(widget.tax) / 100);

    double finalbill =
        (double.parse(widget.bill) + taxamount + widget.tip) / widget.friends;

    setState(() {
      dividedamount = finalbill.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 40),
                child: Text(
                  "Result",
                  style: GoogleFonts.montserrat(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 40),
              child: Text("Split Bill",
                  style: GoogleFonts.montserrat(
                      fontSize: 25, fontWeight: FontWeight.w700)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(color: Colors.brown[400]),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Divisão",
                            style: GoogleFonts.montserrat(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "\$$dividedamount",
                            style: GoogleFonts.montserrat(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Amigos",
                                style: infostyle,
                              ),
                              Text(
                                "Taxa",
                                style: infostyle,
                              ),
                              Text(
                                "Gorjeta",
                                style: infostyle,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.friends.round().toString(),
                                style: infostyle,
                              ),
                              Text(
                                "${widget.tax}%",
                                style: infostyle,
                              ),
                              Text(
                                "\$${widget.tip.round().toString()}",
                                style: infostyle,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Card(
                child: Column(
                  children: [
                    Text(
                      "Todos pagaram \$$dividedamount",
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.green[200]),
                        onPressed: () => Navigator.pop(context),
                        child: Center(
                          child: Text(
                            "Calcular Novamente?",
                            style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
