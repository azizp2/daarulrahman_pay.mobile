import 'package:darul_rahman_app/core/error/error_mapper.dart';
import 'package:darul_rahman_app/core/utils/result_utils.dart';
import 'package:darul_rahman_app/features/member/data/sources/member_api_service.dart';
import 'package:darul_rahman_app/features/member/domain/entities/member.dart';
import 'package:darul_rahman_app/features/member/domain/repo/member_repo.dart';
import 'package:darul_rahman_app/features/member/domain/usecases/params/member_request_param.dart';

class MemberRepoImpl implements MemberRepo {
  final MemberApiService api;

  MemberRepoImpl(this.api);

  @override
  Future<Result<void>> add(MemberRequestParam param) async {
    try {
      await api.add(param);
      return const Success(null);
    } catch (e) {
      return Failure(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<List<Member>>> getAll() async {
    try {
      final response = await api.getAll();
      return Success(response.data!);
    } catch (e) {
      return Failure(ErrorMapper.map(e));
    }
  }

  @override
  Future<Result<Member>> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> remove(int id) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> update(int id, Map<String, dynamic> param) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
