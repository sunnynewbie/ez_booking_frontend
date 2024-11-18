class UserModel {
  final int id;
  final String? name;           // Nullable if 'name' can be null
  final String userName;
  final String phoneNo;
  final int gender;
  final String? otp;             // Nullable if 'otp' can be null

  UserModel({
    required this.id,
    this.name,                   // Remove `required` for nullable fields
    required this.userName,
    required this.phoneNo,
    required this.gender,
    this.otp,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,          
      name: json['name'],               
      userName: json['user_name'] ?? '', 
      phoneNo: json['phone_no'] ?? '',
      gender: json['gender'] ?? 0,      
      otp: json['otp'],                
    );
  }
}


// {"message":"OTP verified","status":true,"data":{"id":4,"name":"","phone_no":"9898989899","created_at":"2024-10-26T09:29:41.000Z","updated_at":"2024-11-15T15:22:01.000Z","gender":1}}