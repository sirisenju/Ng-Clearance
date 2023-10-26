
class Admin {
  final String? uid;
  final String firstName;
  final String lastName;
  final String email;
  final String token;
  final String role;
  final String password;
  final String confirmPassword;


  Admin({
    this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.token,
    this.role = 'admin',
    required this.password,
    required this.confirmPassword,
  });

  factory Admin.fromMap(Map<String, dynamic> data, String documentId) {
    return Admin(
        uid: documentId,
        firstName: data['firstName'],
        lastName: data['lastName'],
        role: 'admin',
        password: data['password'],
        confirmPassword: data['confirmPassword'],
        email: data['email'],
        token: data['token']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
      'password': password,
      'confirmPassword': confirmPassword,
      'email': email,
      'token': token,
    };
  }

}