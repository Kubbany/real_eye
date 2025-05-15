class AppValidators {
  // required field
  static String? requiredField(String? value, {bool ignoreValidation = false}) {
    if (ignoreValidation) {
      return null;
    } else if (value == null || value.isEmpty) {
      return "This Field Cannot Be Empty";
    }
    return null;
  }

  static String? emailValidation(String? value, {bool ignoreValidation = false}) {
    if (ignoreValidation) {
      return null;
    } else if (value == null || value.isEmpty) {
      return "This Field Cannot Be Empty";
    }
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (ignoreValidation) {
      return null;
    } else if (!emailRegex.hasMatch(value)) {
      return "Please Enter A Valid Email";
    }
    return null;
  }
}
