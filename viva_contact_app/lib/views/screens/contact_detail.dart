import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:viva_contact_app/Controller/db_controller.dart';
import 'package:viva_contact_app/Modals/contact_modal.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments as ContactModal;

    DbController dbController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                  radius: 80,
                  child: Text(
                    "${data.name[0].capitalizeFirst}",
                    style: const TextStyle(fontSize: 80),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Text("Name : ",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      Text(
                        "${data.name.capitalizeFirst}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text("Number : ", style: TextStyle(fontSize: 20)),
                      Text(
                        "${data.number}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.call),
                  onPressed: () {
                    dbController.call(number: data.number.toString());
                  },
                  label: Text("Call"),
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.message),
                  onPressed: () {
                    dbController.sms(path: data.name);
                  },
                  label: Text("Message"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
