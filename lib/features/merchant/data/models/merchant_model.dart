import 'package:darul_rahman_app/features/merchant/domain/entities/merchant.dart';

class MerchantModel extends Merchant {
  MerchantModel(
      {super.id,
      super.name,
      super.email,
      super.address,
      super.phone,
      super.isActive});

  factory MerchantModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return MerchantModel();

    return MerchantModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        address: json['address'],
        isActive: json['is_active']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
        'is_active': isActive
      };
}
