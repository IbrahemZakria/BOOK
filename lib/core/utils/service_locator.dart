import 'package:book/core/helper/services/api_servises.dart';
import 'package:book/features/home/data/data_sources/local/home_local_data_sources_impel.dart';
import 'package:book/features/home/data/data_sources/remote/home_remote_data_sources_impel.dart';
import 'package:book/features/home/data/repos/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupSeviseLocator() {
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSourcesImpel: HomeRemoteDataSourcesImpel(ApiServises()),
      homeLocalDataSourcesImpel: HomeLocalDataSourcesImpel(),
    ),
  );

  // Alternatively you could write it if you don't like global variables
}
