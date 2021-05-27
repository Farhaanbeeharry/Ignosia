import 'package:web/Common/Common.dart';

class MemberWidgetController {
  Future<void> deleteMember(String id, Function callSetState) {
    int value;
    for (int i = 0; i < Common.memberList.length; i++) {
      if (Common.memberList[i].iD == id) {
        value = i;
        break;
      }
    }
    Common.memberList.removeAt(value);
    Common.memberWidgetList.removeAt(value);

    callSetState();
  }
}
