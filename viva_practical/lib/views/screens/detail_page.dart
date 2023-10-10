import 'package:flutter/material.dart';

import '../../modal/country_modal.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    country data = ModalRoute.of(context)!.settings.arguments as country;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffDBE2EF),
        centerTitle: true,
        title: Text(
          "${data.name['common']}",
          style: TextStyle(color: Color(0xff112D4E)),
        ),
      ),
      backgroundColor: Color(0xffDBE2EF),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Country Name : ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff112D4E)),
                ),
                Text("${data.name["common"]}",
                    style: TextStyle(color: Color(0xff112D4E), fontSize: 15)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Population : ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff112D4E)),
                ),
                Text("${data.population}",
                    style: TextStyle(color: Color(0xff112D4E), fontSize: 15)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Capital : ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff112D4E)),
                ),
                Text("${data.capital[0]}",
                    style: TextStyle(color: Color(0xff112D4E), fontSize: 15)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Language : ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff112D4E)),
                ),
                Text("${data.languages["eng"]}",
                    style: TextStyle(color: Color(0xff112D4E), fontSize: 15)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
