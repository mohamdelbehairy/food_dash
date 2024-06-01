class UserDataModel {
  final String userID, profileImage, fullName, email;
  String? nickName, dateOfBirth, phoneNumber, gender;
  bool? isFacbookAuth, isGoogleAuth, isEmailAuth, isRememberMe;

  UserDataModel(
      {required this.userID,
      required this.profileImage,
      required this.fullName,
      required this.email,
      this.nickName,
      this.dateOfBirth,
      this.phoneNumber,
      this.gender,
      this.isFacbookAuth,
      this.isGoogleAuth,
      this.isEmailAuth,
      this.isRememberMe});

  factory UserDataModel.fromJson(jsonData) {
    return UserDataModel(
        userID: jsonData['userID'],
        profileImage: jsonData['profileImage'],
        fullName: jsonData['fullName'],
        nickName: jsonData['nickName'],
        dateOfBirth: jsonData['dateOfBirth'],
        email: jsonData['email'],
        phoneNumber: jsonData['phoneNumber'],
        gender: jsonData['gender'],
        isFacbookAuth: jsonData['isFacbookAuth'],
        isGoogleAuth: jsonData['isGoogleAuth'],
        isEmailAuth: jsonData['isEmailAuth'],
        isRememberMe: jsonData['isRememberMe']);
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
      'gender': gender,
      'isFacbookAuth': isFacbookAuth,
      'isGoogleAuth': isGoogleAuth,
      'isEmailAuth': isEmailAuth,
      'isRememberMe': isRememberMe
    };
  }
}
