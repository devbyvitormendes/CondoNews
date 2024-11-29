import 'package:intl/intl.dart';

class StringUtils {

  String formatDate(String date) {
    return DateFormat('dd/MM/yyyy HH:mm').format(DateTime.parse(date));
  }

}
