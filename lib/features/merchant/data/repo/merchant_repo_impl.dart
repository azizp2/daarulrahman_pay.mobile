import 'package:darul_rahman_app/core/error/error_mapper.dart';
import 'package:darul_rahman_app/core/utils/result_utils.dart';
import 'package:darul_rahman_app/features/merchant/data/sources/merchant_api_service.dart';
import 'package:darul_rahman_app/features/merchant/domain/entities/merchant.dart';
import 'package:darul_rahman_app/features/merchant/domain/repo/merchant_repo.dart';
import 'package:darul_rahman_app/features/merchant/domain/usecases/params/merchant_request_param.dart';

class MerchantRepoImpl implements MerchantRepo {
  final MerchantApiService api;

  MerchantRepoImpl(this.api);

  @override
  Future<Result<List<Merchant>>> getAll() async {
    try {
      final response = await api.getAll();
      return Success(response.data);
    } catch (e) {
      return Failure(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> add(MerchantRequestParam param) async {
    try {
      await api.add(param);
      return const Success(null);
    } catch (e) {
      return Failure(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<Merchant>> getById(int id) async {
    try {
      final response = await api.getById(id);
      return Success(response.data);
    } catch (e) {
      return Failure(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> remove(int id) async {
    try {
      await api.remove(id);
      return const Success(null);
    } catch (e) {
      return Failure(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> update(int id, MerchantRequestParam param) async {
    try {
      await api.update(id, param);
      return const Success(null);
    } catch (e) {
      return Failure(ErrorMapper.map(e));
    }
  }
}
