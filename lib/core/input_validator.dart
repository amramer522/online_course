class InputValidator {
  static String? emailValidator(value) {
    if (value!.isEmpty) {
      return "please enter your email";
    }
    return null;
  }

  static String? passwordValidator(value) {
    if (value!.isEmpty) {
      return "please enter your password";
    } else if (value.length < 8) {
      return "password must be at least 8 digits";
    }
    return null;
  }
}
