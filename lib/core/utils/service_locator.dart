import 'package:book/core/helper/services/api_servises.dart';
import 'package:book/features/home/data/repos/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(apiServises: ApiServises()),
  );

  // Alternatively you could write it if you don't like global variables
}
