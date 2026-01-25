import 'package:darul_rahman_app/features/merchant/data/models/merchant_model.dart';
import 'package:darul_rahman_app/features/user/data/models/user_model.dart';

class LoginResponse {
  final UserModel user;
  final MerchantModel merchant;
  final String token;

  LoginResponse(this.user, this.merchant, {required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      UserModel.fromJson(json['user']),
      MerchantModel.fromJson(json['merchant']),
      token: json['token'],
    );
  }
}
