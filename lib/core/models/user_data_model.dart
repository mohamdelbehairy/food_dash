class UserDataModel {
  final String userID,
      profileImage,
      fullName,
      nickName,
      dateOfBirth,
      email,
      phoneNumber,
      gender;

  UserDataModel(
      {required this.userID,
      required this.profileImage,
      required this.fullName,
      required this.nickName,
      required this.dateOfBirth,
      required this.email,
      required this.phoneNumber,
      required this.gender});

  factory UserDataModel.fromJson(jsonData) {
    return UserDataModel(
        userID: jsonData['userID'],
        profileImage: jsonData['profileImage'],
        fullName: jsonData['fullName'],
        nickName: jsonData['nickName'],
        dateOfBirth: jsonData['dateOfBirth'],
        email: jsonData['email'],
        phoneNumber: jsonData['phoneNumber'],
        gender: jsonData['gender']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'profileImage': profileImage,
      'fullName': fullName,
      'nickName': nickName,
      'dateOfBirth': dateOfBirth,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender
    };
  }
}
