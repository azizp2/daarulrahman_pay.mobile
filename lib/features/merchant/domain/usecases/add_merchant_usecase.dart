import 'package:darul_rahman_app/core/utils/result_utils.dart';
import 'package:darul_rahman_app/features/merchant/domain/repo/merchant_repo.dart';
import 'package:darul_rahman_app/features/merchant/domain/usecases/params/merchant_request_param.dart';

class AddMerchantUsecase {
  final MerchantRepo repo;

  AddMerchantUsecase(this.repo);

  Future<Result<void>> call(MerchantRequestParam param) => repo.add(param);
}
