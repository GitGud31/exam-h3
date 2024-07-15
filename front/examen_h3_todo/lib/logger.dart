import 'package:logger/logger.dart';

class L {
  static void debug(String from, dynamic msg) {
    final logger = Logger();

    logger.d(from, error: msg);
  }
}
