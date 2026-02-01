import 'package:darul_rahman_app/core/utils/result_utils.dart';
import 'package:darul_rahman_app/features/member/domain/entities/member.dart';
import 'package:darul_rahman_app/features/member/domain/usecases/params/member_request_param.dart';

abstract class MemberRepo {
  MemberRepo(find);
  Future<Result<List<Member>>> getAll();
  Future<Result<Member>> getById(int id);
  Future<Result<void>> add(MemberRequestParam param);
  Future<Result<void>> update(int id, Map<String, dynamic> param);
  Future<Result<void>> remove(int id);
}
