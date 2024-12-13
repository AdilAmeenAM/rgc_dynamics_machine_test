class UserModel {
  final String fname;
  final String lname;
  final String username;
  final String email;
  final String profilePic;

  UserModel({
    required this.fname,
    required this.lname,
    required this.username,
    required this.email,
    required this.profilePic,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fname: json['fname'],
      lname: json['lname'],
      username: json['username'],
      email: json['email'],
      profilePic: json['profile_pic'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fname': fname,
      'lname': lname,
      'username': username,
      'email': email,
      'profile_pic': profilePic,
    };
  }
}
