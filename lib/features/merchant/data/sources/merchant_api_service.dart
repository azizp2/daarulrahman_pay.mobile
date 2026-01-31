import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:darul_rahman_app/core/constant/api_constant.dart';
import 'package:darul_rahman_app/core/network/api_response.dart';
import 'package:darul_rahman_app/features/merchant/data/models/merchant_model.dart';
import 'package:darul_rahman_app/features/merchant/domain/usecases/params/merchant_request_param.dart';

part 'merchant_api_service.g.dart';

@RestApi()
abstract class MerchantApiService {
  factory MerchantApiService(Dio dio, {String baseUrl}) = _MerchantApiService;

  @GET("${EndpointConstant.merchant}/getAll")
  Future<ApiResponse<List<MerchantModel>>> getAll({
    @Query("page") int page = 1,
    @Query("perPage") int perPage = 10,
  });

  @GET("${EndpointConstant.merchant}/findById/{id}")
  Future<ApiResponse<MerchantModel>> getById(
    @Path("id") int id,
  );

  @POST("${EndpointConstant.merchant}/create")
  Future<ApiResponse<dynamic>> add(
    @Body() MerchantRequestParam param,
  );

  @PUT("${EndpointConstant.merchant}/update/{id}")
  Future<ApiResponse<dynamic>> update(
    @Path("id") int id,
    @Body() MerchantRequestParam param,
  );

  @DELETE("${EndpointConstant.merchant}/deleted/{id}")
  Future<ApiResponse<dynamic>> remove(
    @Path("id") int id,
  );
}
