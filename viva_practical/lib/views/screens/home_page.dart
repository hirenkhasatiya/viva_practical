import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viva_practical/controller/country_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffDBE2EF),
        title: const Text("Country App",
            style: TextStyle(color: Color(0xff112D4E))),
        centerTitle: true,
        actions: [
          Consumer<countryController>(builder: (context, Provider, child) {
            return IconButton(
                onPressed: () {
                  Provider.listchange();
                },
                icon: Icon(Provider.list ? Icons.grid_view : Icons.list));
          })
        ],
      ),
      backgroundColor: const Color(0xffDBE2EF),
      body: Consumer<countryController>(builder: (context, Provider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Provider.list
              ? ListView.builder(
                  itemCount: Provider.allcountry.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: ListTile(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("Detail_Screen",
                                arguments: Provider.allcountry[index]);
                          },
                          icon: Icon(Icons.navigate_next),
                        ),
                        title: Text(
                          "${Provider.allcountry[index].name["common"]}",
                        ),
                        subtitle: Text(
                          "${Provider.allcountry[index].capital[0]}",
                        ),
                        tileColor: Color(0xff3F72AF).withOpacity(0.5),
                        leading: CircleAvatar(
                          foregroundColor: Colors.white,
                          foregroundImage: NetworkImage(
                              Provider.allcountry[index].flage['png']),
                        ),
                      ),
                    );
                  },
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3 / 2),
                  itemCount: Provider.allcountry.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("Detail_Screen",
                          arguments: Provider.allcountry[index]);
                    },
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    Provider.allcountry[index].flage['png']),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff3F72AF).withOpacity(0.5),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                            height: 30,
                            width: double.infinity,
                            color: Color(0xff112D4E),
                            child: Text(
                              "${Provider.allcountry[index].name['common']}",
                              style: const TextStyle(
                                  color: Color(0xffDBE2EF),
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      }),
    );
  }
}
