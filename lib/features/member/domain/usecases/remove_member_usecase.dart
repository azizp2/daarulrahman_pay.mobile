import 'package:darul_rahman_app/core/utils/result_utils.dart';
import 'package:darul_rahman_app/features/member/domain/repo/member_repo.dart';

class RemoveMemberUsecase {
  final MemberRepo repo;

  RemoveMemberUsecase(this.repo);

  Future<Result<void>> call(int id) => repo.remove(id);
}
