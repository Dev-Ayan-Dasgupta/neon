import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  // ! Miscellaneous
  static String passPhrase = dotenv.env['PASS_PHRASE'] ?? "";

  // ! Authentication
  static String login = dotenv.env['LOGIN'] ?? "";
}
