class AppValidators {
  // required field
  static String? requiredField(String? value) {
    if (value == null) {
      return "This Field Cannot Be Empty";
    }
    return null;
  }

  static String? emailValidation(String? value) {
    if (value == null) {
      return "This Field Cannot Be Empty";
    }
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value.isEmpty) {
      return null;
    }
    if (!emailRegex.hasMatch(value)) {
      return "Please Enter A Valid Email";
    }
    return null;
  }
}
