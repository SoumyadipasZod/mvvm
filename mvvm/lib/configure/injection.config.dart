import 'package:get_it/get_it.dart';
import '../api_client/image_api_client/image_api_client.dart';
import '../api_client/image_api_client/image_api_client_impl.dart';
import '../repository/image_repository/image_repo.dart';
import '../repository/image_repository/image_repo_impl.dart';
import 'injection.dart';
import 'network_client/network_client.dart';
import 'network_client/network_client_impl.dart';

final getIt = GetIt.instance;

void $initGetIt({String? environment}) {
  if (environment == Env.prod) {
    _registerProdDependencies();
  }
}


void _registerProdDependencies() {
  getIt
    ..registerFactory<NetworkClient>(() => NetworkClientImpl())
    ..registerFactory<ImageRepo>(() => ImageRepoImpl())
    ..registerFactory<ImageApiClient>(() => ImageApiClientImpl());

  /*..registerLazySingleton<OrderTrackingAPIClient>(
        () => OrderTrackingAPIClientImplementation())
      ..registerLazySingleton<OrderTrackingRepo>(() => OrderTrackingRepoImplementation());*/
}
