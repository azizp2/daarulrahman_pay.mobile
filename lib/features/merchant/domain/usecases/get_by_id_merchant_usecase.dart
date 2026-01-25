import 'package:darul_rahman_app/core/utils/result_utils.dart';
import 'package:darul_rahman_app/features/merchant/domain/entities/merchant.dart';
import 'package:darul_rahman_app/features/merchant/domain/repo/merchant_repo.dart';

class GetByIdMerchantUsecase {
  final MerchantRepo repo;

  GetByIdMerchantUsecase(this.repo);

  Future<Result<Merchant>> call(int id) => repo.getById(id);
}
