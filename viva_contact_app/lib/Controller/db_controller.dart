import 'dart:developer';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viva_contact_app/Helpers/db_helper.dart';
import 'package:viva_contact_app/Modals/contact_modal.dart';

class DbController extends GetxController {
  RxList<ContactModal> allContacts = <ContactModal>[].obs;

  bool backup = false;

  DbController() {
    init();
  }

  Logger logger = Logger();

  changevalue() {
    backup = !backup;
    update();
  }

  Future<void> init() async {
    allContacts(await DbHelper.dbHelper.getData());
  }

  Future<void> updatecontact({required ContactModal contact}) async {
    await DbHelper.dbHelper.update(contact: contact).then(
          (value) =>
              init().onError((error, stackTrace) => logger.e('ERROR : $error')),
        );
  }

  Future<void> insertcontact({required ContactModal contact}) async {
    await DbHelper.dbHelper.insert(contact: contact).then(
          (value) =>
              init().onError((error, stackTrace) => logger.e('ERROR : $error')),
        );
  }

  Future<void> deletcontact({required ContactModal contact}) async {
    await DbHelper.dbHelper.delete(contact: contact).then(
          (value) =>
              init().onError((error, stackTrace) => logger.e('ERROR : $error')),
        );
  }

  call({required String number}) async {
    Uri uri = Uri(
      scheme: 'tel',
      path: number,
    );
    await launchUrl(uri);
  }

  sms({required String path}) async {
    Uri uri = Uri(
      scheme: 'sms',
      path: path,
    );
    await launchUrl(uri);
  }
}
