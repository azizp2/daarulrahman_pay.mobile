class Validators {
  Validators._();

  // 📧 Email Validation
  static bool isValidEmail(String? email) {
    if (email == null || email.trim().isEmpty) return true;

    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
      r"[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$",
    );

    return emailRegex.hasMatch(email.trim());
  }

  // 📱 Phone Validation (Indonesia-friendly)
  static bool isValidPhone(String? phone) {
    if (phone == null || phone.trim().isEmpty) return true;

    // Remove space, dash, etc
    final cleaned = phone.replaceAll(RegExp(r'\s+|-'), '');

    // Support:
    // 08xxxxxxxxxx
    // +628xxxxxxxxxx
    // 628xxxxxxxxxx
    final phoneRegex = RegExp(r'^(?:\+62|62|0)8[1-9][0-9]{6,10}$');

    return phoneRegex.hasMatch(cleaned);
  }
}
