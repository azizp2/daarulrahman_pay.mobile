import 'package:darul_rahman_app/core/constant/api_constant.dart';
import 'package:darul_rahman_app/core/network/api_response.dart';
import 'package:darul_rahman_app/features/merchant/data/models/merchant_model.dart';
import 'package:darul_rahman_app/features/merchant/domain/entities/merchant.dart';
import 'package:darul_rahman_app/features/merchant/domain/usecases/params/merchant_request_param.dart';
import 'package:dio/dio.dart';

class MerchantApiService {
  final Dio dio;

  MerchantApiService(this.dio);

  Future<ApiResponse<List<MerchantModel>>> getAll() async {
    final response =
        await dio.get("${EndpointConstant.merchant}/getAll?page=1&perPage=10");

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      (json) => (json as List<dynamic>)
          .map((e) => MerchantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<ApiResponse<Merchant>> getById(int id) async {
    final response = await dio.get("${EndpointConstant.merchant}/findById/$id");

    return ApiResponse.fromJson(response.data,
        (json) => MerchantModel.fromJson(json as Map<String, dynamic>));
  }

  Future<ApiResponse<void>> add(MerchantRequestParam param) async {
    final response = await dio.post(
      "${EndpointConstant.merchant}/create",
      data: param.toJson(),
    );

    return ApiResponse.fromJson(response.data, (json) => null);
  }

  Future<ApiResponse<void>> update(int id, MerchantRequestParam param) async {
    final response = await dio.put(
      "${EndpointConstant.merchant}/update/$id",
      data: param.toJson(),
    );

    return ApiResponse.fromJson(response.data, (json) => null);
  }

  Future<ApiResponse<void>> remove(int id) async {
    final response =
        await dio.delete("${EndpointConstant.merchant}/deleted/$id");

    return ApiResponse.fromJson(response.data, (json) => null);
  }
}
