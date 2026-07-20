import 'package:get_it/get_it.dart';
import 'package:nuclone/app/feature/home/data/datasources/home_mock_datasource.dart';
import 'package:nuclone/app/feature/home/data/repositories/home_repository_impl.dart';
import 'package:nuclone/app/feature/home/domain/repositories/home_repository.dart';
import 'package:nuclone/app/feature/home/domain/usecases/get_account_data_usecase.dart';
import 'package:nuclone/app/feature/home/presentation/cubit/home_cubit.dart';
import 'package:nuclone/app/feature/pix/data/repositories/pix_repository_impl.dart';
import 'package:nuclone/app/feature/pix/domain/repositories/pix_repository.dart';
import 'package:nuclone/app/feature/pix/domain/usecases/send_pix_usecase.dart';
import 'package:nuclone/app/feature/pix/presentation/cubit/pix_cubit.dart';

final getIt = GetIt.instance;

void setupInjector() {
  getIt.registerLazySingleton<HomeMockDatasource>(
    () => HomeMockDatasourceImpl(),
  );

  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<PixRepository>(
    () => PixRepositoryImpl(),
  );

  getIt.registerLazySingleton<GetAccountDataUseCase>(
    () => GetAccountDataUseCase(getIt()),
  );
  getIt.registerLazySingleton<SendPixUseCase>(
    () => SendPixUseCase(getIt()),
  );

  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(getIt()),
  );
  getIt.registerFactory<PixCubit>(
    () => PixCubit(getIt()),
  );
}
