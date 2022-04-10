class UserItem {
  String id = "";
  String firstName = "";
  String lastName = "";
  String fullName = "";
  String email = "";
  String phone = "";
  String username = "";

//create a constructor for the user
  UserItem(
      {this.id = "",
      this.firstName = "",
      this.lastName = "",
      this.fullName = "",
      this.email = "",
      this.phone = "",
      this.username = ""});

//Convert the user to a user map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'username': username
    };
  }
}
