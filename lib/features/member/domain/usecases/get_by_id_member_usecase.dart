import 'package:darul_rahman_app/core/utils/result_utils.dart';
import 'package:darul_rahman_app/features/member/domain/entities/member.dart';
import 'package:darul_rahman_app/features/member/domain/repo/member_repo.dart';

class GetByIdMemberUsecase {
  final MemberRepo repo;

  GetByIdMemberUsecase(this.repo);

  Future<Result<Member>> call(int id) => repo.getById(id);
}
