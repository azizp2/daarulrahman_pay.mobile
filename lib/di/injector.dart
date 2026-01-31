import 'package:darul_rahman_app/features/member/data/repo/member_repo_impl.dart';
import 'package:darul_rahman_app/features/member/data/sources/member_api_service.dart';
import 'package:darul_rahman_app/features/member/domain/repo/member_repo.dart';
import 'package:darul_rahman_app/features/member/domain/usecases/get_member_usecase.dart';
import 'package:darul_rahman_app/features/member/presentation/controllers/member_controller.dart';
import 'package:darul_rahman_app/features/merchant/domain/usecases/remove_merchant_usercase.dart';
import 'package:darul_rahman_app/widgets/loading/loading_controller.dart';
import 'package:darul_rahman_app/core/network/dio_client.dart';
import 'package:darul_rahman_app/features/auth/data/repo/auth_repo.dart';
import 'package:darul_rahman_app/features/auth/data/sources/auth_api_service.dart';
import 'package:darul_rahman_app/features/auth/domain/repo/auth_repo_impl.dart';
import 'package:darul_rahman_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:darul_rahman_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:darul_rahman_app/features/merchant/data/repo/merchant_repo_impl.dart';
import 'package:darul_rahman_app/features/merchant/data/sources/merchant_api_service.dart';
import 'package:darul_rahman_app/features/merchant/domain/repo/merchant_repo.dart';
import 'package:darul_rahman_app/features/merchant/domain/usecases/add_merchant_usecase.dart';
import 'package:darul_rahman_app/features/merchant/domain/usecases/get_by_id_merchant_usecase.dart';
import 'package:darul_rahman_app/features/merchant/domain/usecases/get_merchant_usecase.dart';
import 'package:darul_rahman_app/features/merchant/domain/usecases/update_merchant_usecase.dart';
import 'package:get/get.dart';

class Injector {
  static void init() {
    // 🔴 GLOBAL
    Get.put(LoadingController(), permanent: true);

    // 🔵 NETWORK
    final dio = DioClient.create();
    Get.put(AuthApiService(dio));
    Get.put(MerchantApiService(dio));
    Get.put(MemberApiService(dio));

    // 🟢 REPOSITORY
    Get.put<AuthRepo>(AuthRepoImpl(Get.find()));
    Get.put<MerchantRepo>(MerchantRepoImpl(Get.find()));
    Get.put<MemberRepo>(MemberRepoImpl(Get.find()));

    // 🟡 USECASE
    Get.put(LoginUsecase(Get.find()));

    Get.put(GetMerchantUsecase(Get.find()));
    Get.put(AddMerchantUsecase(Get.find()));
    Get.put(GetByIdMerchantUsecase(Get.find()));
    Get.put(UpdateMerchantUseCase(Get.find()));
    Get.put(RemoveMerchantUsercase(Get.find()));

    Get.put(GetMemberUsecase(Get.find()));

    // Get.put(GetMemberUsecase(Get.find()));

    // 🟣 CONTROLLER GLOBAL
    Get.put(AuthController(Get.find()));
    Get.put(MemberController(Get.find()));
  }
}
