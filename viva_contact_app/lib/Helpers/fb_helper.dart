import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:viva_contact_app/Modals/contact_modal.dart';

class FbHelper {
  FbHelper._();

  static final FbHelper fbHelper = FbHelper._();

  String collectionPath = "Contacts";

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getContacts() {
    return firestore.collection(collectionPath).snapshots();
  }

  addContact({required ContactModal contact}) {
    firestore
        .collection(collectionPath)
        .doc(contact.id.toString())
        .set(contact.toMap);
  }

  editContact({required ContactModal contact}) {
    firestore
        .collection(collectionPath)
        .doc(contact.id.toString())
        .update(contact.toMap);
  }

  deletContact({required ContactModal contact}) {
    firestore.collection(collectionPath).doc(contact.id.toString()).delete();
  }
}
