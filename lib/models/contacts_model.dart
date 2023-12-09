class Contact {
  final int? id;
  final String firstName;
  final String lastName;
  final String mobileNumber;

  Contact(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.mobileNumber});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'mobileNumber': mobileNumber,
    };
  }

  Contact.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        firstName = map['firstName'],
        lastName = map['lastName'],
        mobileNumber = map['mobileNumber'];
}
