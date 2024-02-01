import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:viva_contact_app/Helpers/db_helper.dart';
import 'package:viva_contact_app/Modals/contact_modal.dart';

class DbController extends GetxController {
  RxList<ContactModal> allContacts = <ContactModal>[].obs;

  DbController() {
    init();
  }

  init() async {
    allContacts(await (DbHelper.dbhelper.getAllcontacts()));
  }

  insertcontact({required ContactModal contact}) async {
    await (DbHelper.dbhelper.insertcontact(contact: contact));
    init();
  }

  deletcontact({required int id}) async {
    await (DbHelper.dbhelper.deletcontact(id: id));
    init();
  }
}
