import 'package:darul_rahman_app/core/utils/result_utils.dart';
import 'package:darul_rahman_app/features/merchant/domain/entities/merchant.dart';
import 'package:darul_rahman_app/features/merchant/domain/usecases/params/merchant_request_param.dart';

abstract class MerchantRepo {
  MerchantRepo(find);

  Future<Result<List<Merchant>>> getAll();
  Future<Result<Merchant>> getById(int id);
  Future<Result<void>> add(MerchantRequestParam param);
  Future<Result<void>> update(int id, MerchantRequestParam param);
  Future<Result<void>> remove(int id);
}
