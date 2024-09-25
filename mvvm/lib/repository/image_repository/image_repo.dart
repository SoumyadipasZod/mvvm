
import 'package:injectable/injectable.dart';
import '../../configure/resource.dart';
@Environment("dev")
@injectable
abstract class ImageRepo {
  Future<Resource> getImages({
        String? q,
        String? image_type,
        int? page,
        int? per_page
      });
}