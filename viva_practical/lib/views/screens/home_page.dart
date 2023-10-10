import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viva_practical/controller/country_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffDBE2EF),
        title: Text("Country App", style: TextStyle(color: Color(0xff112D4E))),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      backgroundColor: Color(0xffDBE2EF),
      body: Consumer<countryController>(builder: (context, Provider, child) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
          itemCount: Provider.allcountry.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("Detail_Screen",
                  arguments: Provider.allcountry[index]);
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff3F72AF).withOpacity(0.5),
              ),
              child: Center(
                  child: Text(
                "${Provider.allcountry[index].name['common']}",
                style: TextStyle(
                    color: Color(0xff112D4E),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
        );
      }),
    );
  }
}
