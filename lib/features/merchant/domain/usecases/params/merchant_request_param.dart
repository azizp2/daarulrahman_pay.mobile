class MerchantRequestParam {
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final bool isActive;

  MerchantRequestParam({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.isActive,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
        'is_active': isActive
      };
}
