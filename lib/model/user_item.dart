class UserItem {
  String id = "";
  String firstName = "";
  String lastName = "";
  String fullName = "";
  String email = "";

//create a constructor for the user item
  UserItem(
      {this.id = "",
      this.firstName = "",
      this.lastName = "",
      this.fullName = "",
      this.email = ""});

//Convert the user to a user map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'fullName': fullName,
      'email': email
    };
  }
}
