class AppValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your email";
    }

    final emailRegex = RegExp(
      r"^[a-zA-Z0-9._a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your password";
    }
    if (value.trim().length < 6) {
      return "Min 6 characters";
    }
    return null;
  }
}
