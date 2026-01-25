import 'package:darul_rahman_app/core/utils/result_utils.dart';
import 'package:darul_rahman_app/features/merchant/domain/entities/merchant.dart';
import 'package:darul_rahman_app/features/merchant/domain/repo/merchant_repo.dart';

class GetMerchantUsecase {
  final MerchantRepo repo;

  GetMerchantUsecase(this.repo);

  Future<Result<List<Merchant>>> call() => repo.getAll();
}
