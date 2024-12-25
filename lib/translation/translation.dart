import 'package:get/get.dart';
import 'package:startup_sw_dev/translation/en_us.dart';
import 'package:startup_sw_dev/translation/id_id.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EnUs().messages,
        'id_ID': IdId().messages,
      };
}
