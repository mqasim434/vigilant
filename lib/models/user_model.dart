class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String password;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  // Convert Firestore data to UserModel
  factory UserModel.fromFirestore(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'] as String,
      name: data['name'] as String,
      email: data['email'] as String,
      phone: data['phone'] as String,
      password: data['password'] as String,
    );
  }

  // Convert UserModel to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }
}
