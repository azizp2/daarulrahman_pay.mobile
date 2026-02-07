import 'package:darul_rahman_app/core/utils/result_utils.dart';
import 'package:darul_rahman_app/features/member/domain/repo/member_repo.dart';
import 'package:darul_rahman_app/features/member/domain/usecases/params/member_request_param.dart';

class UpdateMemberUsecase {
  final MemberRepo repo;

  UpdateMemberUsecase(this.repo);

  Future<Result<void>> call(int id, MemberRequestParam param) =>
      repo.update(id, param);
}
