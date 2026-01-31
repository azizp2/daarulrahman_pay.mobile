import 'package:darul_rahman_app/core/base/base_controller.dart';
import 'package:darul_rahman_app/features/member/domain/entities/member.dart';
import 'package:darul_rahman_app/features/member/domain/usecases/get_member_usecase.dart';
import 'package:get/get.dart';

class MemberController extends BaseController {
  final GetMemberUsecase getMemberUsecase;

  final members = <Member>[].obs;

  MemberController(this.getMemberUsecase);

  @override
  void onReady() {
    super.onReady();
    getMembers();
  }

  Future<void> getMembers() async {
    loading.show();
    try {
      final result = await getMemberUsecase();
      await handleResult(result, onSuccess: (data) async {
        members.assignAll(data);
      });
    } finally {
      loading.hide();
    }
  }
}
