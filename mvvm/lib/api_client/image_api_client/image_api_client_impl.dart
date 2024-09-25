import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mvvm/api_client/image_api_client/image_api_client.dart';
import '../../api_constant/url_const.dart';
import '../../configure/network_client/network_client_impl.dart';
import '../../configure/resource.dart';
import '../../configure/status.dart';
import '../../model/image_model.dart';
class ImageApiClientImpl extends ImageApiClient {
   late NetworkClientImpl _networkClient;
  
  @override
  Future<Resource> getImages({
        String? q,
        String? image_type,
        int? page,
        int? per_page
      }) async{
    try {
      Map<String, dynamic>? params = {};
        params.addAll({'key' : '29742592-34a98623eca3ae13204898565'});
      if (q != null) {
        params.addAll({'q': q.toString()});
      }
      if (image_type != null) {
        params.addAll({'image_type': image_type.toString()});
      }
      if (page != null) {
        params.addAll({'limit': page.toString()});
      }
      if (per_page != null) {
        params.addAll({'page': per_page.toString()});
      }
      // var bodyMap = {
      //   "UserId": 'userId',
      //   "CompanyId": 'companyId',
      // };
      // print("Graph Data=>  " + bodyMap.toString());
      // String str = json.encode(bodyMap);
      // String queryString = Uri(queryParameters: queryParameter).query;
      // String apiUrl = queryString.isNotEmpty ? '$url?$queryString' : url;
      String queryString = Uri(queryParameters: params).query;
      String apiUrl = queryString.isNotEmpty ? '$imageUrl?$queryString' : imageUrl;
      log("URl : ${apiUrl}");
      Response response = await http.get(Uri.parse(apiUrl),);
      log("RESPONSE : ${response}");
      int statusCode = response.statusCode;
      log("STATUS CODE :: ${statusCode}");

      if (statusCode == 200) {
          String resp = response.body;
          ImageModel imageModel =
            ImageModel.fromJson(jsonDecode(resp));
          return Resource(status: STATUS.SUCCESS, data: imageModel, message: 'SuccessFully Data Fetched');
      } else {
        return Resource(
            status: STATUS.ERROR,
            message:
                _networkClient!.getHttpErrorMessage(statusCode: statusCode), data: null);
      }
    } catch (ex) {
      if (ex is SocketException) {
        return Resource(status: STATUS.ERROR, message: 'Please check your internet connection!');
      } else {
        return Resource(status: STATUS.ERROR, message: 'Something went wrong');
      }
    }
  }

  



  //------------------------------------extra-------------------------post-------------//
//   import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:go_sales_dearler_app/api_client/common/Resource.dart';

// import '../../../Model/login_data.dart';
// import '../../../api_client/common/Status.dart';
// import '../../../api_client/common/network_client.dart';
// import '../../../api_constant.dart';
// import '../../../constant.dart';
// import '../../../injection.config.dart';
// import '../../../shared_repo/shared_repo.dart';
// import '../db/loadsheet_vs_dispatch_db.dart';
// import '../model/loadsheet_vs_dispatch_model.dart';
// import 'loadsheet_v_dispatch_api_client.dart';
// import 'package:http/http.dart' as http;

// class LoadSheetVsDispatchAPIClientImpl extends LoadSheetVsDispatchAPIClient {
//   NetworkClient? _networkClient = getIt<NetworkClient>();

//   // Dio dio = Dio();
//   @override
//   Future<Resource> getLoadSheetVsDispatchReport(
//       {required String fromDate, required String toDate}) async {
//     try {
//       SharedPref _pref = getIt<SharedPref>();

//       LoginData userData = (await _pref.getUserData())!;
//       print("fromDate===----${fromDate}");
//       print("fromDate===----${toDate}");
//       var bodyMap;
//       if (userData.customerTypeName == "Vehicle") {
//         bodyMap = {
//           "FromDate": fromDate,
//           "ToDate": toDate,
//           "VehicleNo": userData.customerCode,
//           "CompanyId": "1"
//         };
//       } else {
//         bodyMap = {
//           "FromDate": fromDate,
//           "ToDate": toDate,
//           "CompanyId": COMPANY_ID
//         };
//       }

//       print(bodyMap);
//       print(
//           "getLoadSheetVsDispatchReport Url====>${GET_LOADSHEET_VS_DISPATCH_REPORT}");
//       String str = json.encode(bodyMap);
//       var response = await http
//           .post(Uri.parse(GET_LOADSHEET_VS_DISPATCH_REPORT), body: str);
//       int statusCode = response.statusCode!;
//       String resp = response.body;
//       print("status code=====>${statusCode}");
//       log("getLoadSheetVsDispatchReport response =====>${resp}");

//       if (statusCode == 200) {
//         LoadSheetVsDispatchReportModel loadSheetVsDispatchReportModel =
//             LoadSheetVsDispatchReportModel.fromJson(jsonDecode(resp));

//         print("loaadshhet=====>${loadSheetVsDispatchReportModel}");

//         if (loadSheetVsDispatchReportModel.status == 1) {
//           return Resource(
//               status: STATUS.SUCCESS, data: loadSheetVsDispatchReportModel);
//         } else {
//           return Resource(
//               status: STATUS.ERROR,
//               message: loadSheetVsDispatchReportModel.msg);
//         }
//       } else {
//         return Resource(
//             status: STATUS.ERROR,
//             message:
//                 _networkClient!.getHttpErrorMessage(statusCode: statusCode));
//       }
//     } catch (ex, stackTrace) {
//       print(stackTrace);

//       if (ex is SocketException) {
//         return Resource(status: STATUS.ERROR, message: CHECK_INTERNET);
//       } else {
//         return Resource(status: STATUS.ERROR, message: 'Something went wrong');
//       }
//     }
//   }
// }

  
}