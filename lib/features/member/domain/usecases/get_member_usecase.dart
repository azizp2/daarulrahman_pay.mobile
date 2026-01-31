import 'package:darul_rahman_app/core/utils/result_utils.dart';
import 'package:darul_rahman_app/features/member/domain/entities/member.dart';
import 'package:darul_rahman_app/features/member/domain/repo/member_repo.dart';

class GetMemberUsecase {
  final MemberRepo repo;

  GetMemberUsecase(this.repo);

  Future<Result<List<Member>>> call() => repo.getAll();
}
