import '../../configure/resource.dart';

abstract class ImageApiClient {
  Future<Resource> getImages({
        String? q,
        String? image_type,
        int? page,
        int? per_page
      });
}