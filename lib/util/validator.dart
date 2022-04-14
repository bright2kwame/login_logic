class Validator {
//is valid email address
  bool isValidEmail(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

//is valid name
  bool isValidName(String name) {
    //all letters both small and uppercase
    bool nameValid = RegExp('[a-zA-Z]').hasMatch(name);
    return nameValid;
  }
}
