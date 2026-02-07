import 'package:darul_rahman_app/core/constant/api_constant.dart';
import 'package:darul_rahman_app/core/network/api_response.dart';
import 'package:darul_rahman_app/features/member/data/models/member_model.dart';
import 'package:darul_rahman_app/features/member/domain/usecases/params/member_request_param.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'member_api_service.g.dart';

@RestApi()
abstract class MemberApiService {
  factory MemberApiService(Dio dio, {String baseUrl}) = _MemberApiService;

  @GET("${EndpointConstant.member}/getAll")
  Future<ApiResponse<List<MemberModel>>> getAll(
      {@Query("page") int page = 1, @Query("perPage") int perPage = 10});

  @POST("${EndpointConstant.member}/create")
  Future<ApiResponse<dynamic>> add(@Body() MemberRequestParam param);

  @GET("${EndpointConstant.member}/findById/{id}")
  Future<ApiResponse<MemberModel>> getById(@Path("id") int id);

  @PUT("${EndpointConstant.member}/update/{id}")
  Future<ApiResponse<dynamic>> update(
      @Path("id") int id, @Body() MemberRequestParam param);

  @DELETE("${EndpointConstant.member}/deleted/{id}")
  Future<ApiResponse<dynamic>> remove(@Path("id") int id);
}
