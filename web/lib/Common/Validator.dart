class Validator {
  static bool checkSpecialCharacter(String text) {
    if (text.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return true;
    } else {
      return false;
    }
  }

  static bool checkUpperCase(String text) {
    if (text.contains(new RegExp(r'[A-Z]'))) {
      return true;
    } else {
      return false;
    }
  }

  static bool checkLowerCase(String text) {
    if (text.contains(new RegExp(r'[a-z]'))) {
      return true;
    } else {
      return false;
    }
  }

  static bool checkNumber(String text) {
    if (text.contains(new RegExp(r'[0-9]'))) {
      return true;
    } else {
      return false;
    }
  }
}
