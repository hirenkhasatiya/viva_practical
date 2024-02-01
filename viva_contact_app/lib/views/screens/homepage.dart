import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:viva_contact_app/Controller/db_controller.dart';
import 'package:viva_contact_app/Helpers/fb_helper.dart';
import 'package:viva_contact_app/Modals/contact_modal.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DbController dbController = Get.put(DbController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact App"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          late String id, name;
          int number = 0;
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add Contact"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(hintText: 'Enter Id'),
                      onSubmitted: (val) {
                        id = val;
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(hintText: 'Enter Name'),
                      onSubmitted: (val) {
                        name = val;
                      },
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration:
                          const InputDecoration(hintText: 'Enter Number'),
                      onSubmitted: (val) {
                        number = int.parse(val);
                      },
                    ),
                  ],
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          ContactModal contact =
                              ContactModal(number: number, name: name, id: id);

                          dbController.insertcontact(contact: contact);

                          Navigator.of(context).pop();
                        },
                        child: const Text("Done"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel"),
                      ),
                    ],
                  )
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
