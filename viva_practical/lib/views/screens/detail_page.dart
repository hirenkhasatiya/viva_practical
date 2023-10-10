import 'package:flutter/material.dart';

import '../../modal/country_modal.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    country data = ModalRoute.of(context)!.settings.arguments as country;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffDBE2EF),
        centerTitle: true,
        title: Text(
          "${data.name['common']}",
          style: const TextStyle(color: Color(0xff112D4E)),
        ),
      ),
      backgroundColor: const Color(0xffDBE2EF),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(data.flage['png']),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.home,
                  size: 40,
                  color: Color(0xff112D4E),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Country Name",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff112D4E)),
                    ),
                    Text(
                      "${data.name["common"]}",
                      style: const TextStyle(
                          color: Color(0xff112D4E), fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_city_rounded,
                  size: 40,
                  color: Color(0xff112D4E),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Capital Name",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff112D4E)),
                    ),
                    Text(
                      "${data.capital[0]}",
                      style: const TextStyle(
                          color: Color(0xff112D4E), fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.people_alt_outlined,
                  size: 40,
                  color: Color(0xff112D4E),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Population",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff112D4E)),
                    ),
                    Text(
                      "${data.population}",
                      style: const TextStyle(
                          color: Color(0xff112D4E), fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.access_time_rounded,
                  size: 40,
                  color: Color(0xff112D4E),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Time Zone",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff112D4E)),
                    ),
                    Text(
                      "${data.timezones[0]}",
                      style: const TextStyle(
                          color: Color(0xff112D4E), fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.language,
                  size: 40,
                  color: Color(0xff112D4E),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Language",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff112D4E)),
                    ),
                    Text(
                      "${data.languages['eng']}",
                      style: const TextStyle(
                          color: Color(0xff112D4E), fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.map,
                  size: 40,
                  color: Color(0xff112D4E),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Area",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff112D4E)),
                    ),
                    Text(
                      "${data.area}",
                      style: const TextStyle(
                          color: Color(0xff112D4E), fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.call,
                  size: 40,
                  color: Color(0xff112D4E),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Calling Code",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff112D4E)),
                    ),
                    Text(
                      "${data.idd['root']}",
                      style: const TextStyle(
                          color: Color(0xff112D4E), fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
