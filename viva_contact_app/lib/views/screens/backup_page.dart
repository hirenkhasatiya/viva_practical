import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:viva_contact_app/Controller/db_controller.dart';

import '../../Helpers/fb_helper.dart';
import '../../Modals/contact_modal.dart';

class BackupPage extends StatelessWidget {
  const BackupPage({super.key});

  @override
  Widget build(BuildContext context) {
    DbController dbController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Backup Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder(
          stream: FbHelper.fbHelper.getContacts(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              QuerySnapshot? snaps = snapShot.data;
              List<QueryDocumentSnapshot> data = snaps?.docs ?? [];
              List<ContactModal> AllContact = data
                  .map(
                    (e) => ContactModal.fromMap(data: e.data() as Map),
                  )
                  .toList();

              return AllContact.isEmpty
                  ? Center(
                      child: Image.asset(
                        'assets/no.png',
                      ),
                    )
                  : ListView.builder(
                      itemCount: AllContact.length,
                      itemBuilder: (context, index) {
                        ContactModal contact = AllContact[index];

                        return GestureDetector(
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
                                          FbHelper.fbHelper
                                              .deletContact(contact: contact);
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
                      });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
