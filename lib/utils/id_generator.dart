import 'package:uuid/uuid.dart';

class IdGenerator {
  static final _uuid = Uuid();

  static String generate() => _uuid.v4();
}
