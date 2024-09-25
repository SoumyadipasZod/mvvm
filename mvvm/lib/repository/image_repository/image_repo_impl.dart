
import 'package:mvvm/repository/image_repository/image_repo.dart';

import '../../../Configure/injection.config.dart';
import '../../../Configure/status.dart';
import '../../api_client/image_api_client/image_api_client.dart';
import '../../configure/resource.dart';
import '../../utils/utils.dart';

class ImageRepoImpl extends ImageRepo{
  ImageApiClient? _imageApiClient = getIt<ImageApiClient>();
  
  @override
  Future<Resource> getImages({
        String? q,
        String? image_type,
        int? page,
        int? per_page
      }) async{
    Utils.printInLog('Images called');
    Resource data = await _imageApiClient!.getImages(
      q: q,
      image_type: image_type,
      page: page,
      per_page: per_page
      );
    if (data.status == STATUS.SUCCESS) {
      Utils.printInLog('Succeed');
    } else {
      Utils.printInLog('Failed');
    }
    return data;
  }
  
}