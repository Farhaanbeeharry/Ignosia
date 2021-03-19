import 'package:encrypt/encrypt.dart' as Encryptor;

class Encrypt {
  String encryptPassword(String password) {
    final key = Encryptor.Key.fromLength(32);
    final iv = Encryptor.IV.fromLength(16);
    final encrypter = Encryptor.Encrypter(Encryptor.AES(key));

    return encrypter.encrypt(password, iv: iv).base64;
  }
}
