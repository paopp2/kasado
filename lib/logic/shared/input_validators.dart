class InputValidators {
  InputValidators._();
  static String? mustNotBeEmpty(String? value) {
    return (value == null || value == '') ? "This field can't be empty" : null;
  }
}
