
class UserData {
  final String? uid;
  final String firstName;
  final String lastName;
  final String userEmail;
  final String matNumber;
  final String role;
  final String password;
  final String confirmPassword;

  UserData({
    this.uid,
    required this.firstName,
    required this.lastName,
    required this.userEmail,
    required this.matNumber,
    this.role = "student",
    required this.password,
    required this.confirmPassword,
  });

  factory UserData.fromMap(Map<String, dynamic> data, String documentId) {
    return UserData(
      uid: documentId,
      firstName: data['firstName'],
      lastName: data['lastName'],
      userEmail: data['userEmail'],
      matNumber: data['matNumber'],
      role: "student",
      password: data['password'],
      confirmPassword: data['confirmPassword']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'userEmail': userEmail,
      'matNumber': matNumber,
      'role': role,
      'password': password,
      'confirmPassword': confirmPassword
    };
  }
}
