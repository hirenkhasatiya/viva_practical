import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:viva_contact_app/Controller/db_controller.dart';
import 'package:viva_contact_app/Controller/theme_controller.dart';
import 'package:viva_contact_app/Helpers/db_helper.dart';
import 'package:viva_contact_app/Helpers/fb_helper.dart';
import 'package:viva_contact_app/Modals/contact_modal.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DbController dbController = Get.put(DbController());

    ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact App"),
        actions: [
          Obx(() => IconButton(
                onPressed: () {
                  themeController.themeChange();
                },
                icon: Icon(themeController.isLight.value
                    ? Icons.light
                    : Icons.dark_mode),
              )),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/backup');
            },
            icon: const Icon(Icons.backup),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: dbController.allContacts.isEmpty
              ? Center(
                  child: Image.asset(
                    'assets/no.png',
                  ),
                )
              : Obx(() {
                  return ListView.builder(
                    itemCount: dbController.allContacts.length,
                    itemBuilder: (context, index) {
                      ContactModal contact = dbController.allContacts[index];
                      return GestureDetector(
                        onDoubleTap: () {
                          late String id, name;
                          late int number;
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Edit Contact"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      enabled: false,
                                      initialValue: contact.id.toString(),
                                      decoration: const InputDecoration(
                                          hintText: 'Enter Id'),
                                      onChanged: (val) {
                                        id = val;
                                      },
                                    ),
                                    TextFormField(
                                      initialValue: contact.name.toString(),
                                      decoration: const InputDecoration(
                                          hintText: 'Enter Name'),
                                      onSaved: (val) {
                                        name = val!;
                                      },
                                    ),
                                    TextFormField(
                                      initialValue: contact.number.toString(),
                                      keyboardType: TextInputType.number,
                                      maxLength: 10,
                                      decoration: const InputDecoration(
                                          hintText: 'Enter Number'),
                                      onSaved: (val) {
                                        number = int.parse(val!);
                                      },
                                    ),
                                  ],
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          ContactModal contact = ContactModal(
                                            number: number,
                                            name: name,
                                            id: int.parse(id),
                                          );

                                          dbController.insertcontact(
                                              contact: contact);

                                          if (dbController.backup == true) {
                                            FbHelper.fbHelper
                                                .editContact(contact: contact);
                                          }

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
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Sure Delete"),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        dbController.deletcontact(
                                            contact: contact);
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Delete"),
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
                            ),
                          );
                        },
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('/detail', arguments: contact);
                        },
                        child: Card(
                          child: ListTile(
                            trailing: IconButton(
                              icon: Icon(Icons.call),
                              onPressed: () {
                                dbController.call(
                                    number: contact.number.toString());
                              },
                            ),
                            title: Text(contact.name),
                            subtitle: Text(contact.number.toString()),
                          ),
                        ),
                      );
                    },
                  );
                })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          late String id, name;
          late int number;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Backup",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Switch(
                          value: dbController.backup,
                          onChanged: (val) {
                            dbController.changevalue();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          ContactModal contact = ContactModal(
                            number: number,
                            name: name,
                            id: int.parse(id),
                          );

                          dbController.insertcontact(contact: contact);

                          if (dbController.backup == true) {
                            FbHelper.fbHelper.addContact(contact: contact);
                          }

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
