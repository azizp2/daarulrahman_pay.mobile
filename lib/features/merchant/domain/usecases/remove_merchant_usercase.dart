import 'package:darul_rahman_app/core/utils/result_utils.dart';
import 'package:darul_rahman_app/features/merchant/domain/repo/merchant_repo.dart';

class RemoveMerchantUsercase {
  final MerchantRepo repo;

  RemoveMerchantUsercase(this.repo);

  Future<Result<void>> call(int id) => repo.remove(id);
}
