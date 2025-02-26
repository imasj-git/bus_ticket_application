import 'package:bus_ticket_app/app/shared_prefs/token_shared_prefs.dart';
import 'package:bus_ticket_app/core/network/api_service.dart';
import 'package:bus_ticket_app/core/network/hive_service.dart';
import 'package:bus_ticket_app/features/auth/data/data_source/local_data_source/auth_local_datasource.dart';
import 'package:bus_ticket_app/features/auth/data/data_source/remote_data_source/auth_remote_datasource.dart';
import 'package:bus_ticket_app/features/auth/data/repository/auth_remote_repository/auth_remote_repository.dart';
import 'package:bus_ticket_app/features/auth/data/repository/auth_repository/auth_local_repository.dart';
import 'package:bus_ticket_app/features/auth/domain/use_case/login_usecase.dart';
import 'package:bus_ticket_app/features/auth/domain/use_case/register_usecase.dart';
import 'package:bus_ticket_app/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:bus_ticket_app/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:bus_ticket_app/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:bus_ticket_app/features/booking/presentation/view_model/booking_cubit.dart';

import 'package:bus_ticket_app/features/booking/presentation/view_model/search_cubit.dart';
import 'package:bus_ticket_app/features/booking/presentation/view_model/seat_cubit.dart';
import 'package:bus_ticket_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:bus_ticket_app/features/onboarding/presentation/view_model/onbording_cubit.dart';
import 'package:bus_ticket_app/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveService();
  await _initApiService();
  await _initSharedPreferences();
  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initSplashScreenDependencies();
  await _initOnboardingScreenDependencies();
  await _initSearchDependencies(); 
  await _initSeatDependencies();  // <-- Add this function
  await _initBookingDependencies();

}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(
    () => HiveService(),
  );
}

_initApiService() {
  // Remote Data Source
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}



_initSeatDependencies() {
  getIt.registerFactory<SeatCubit>(
    () => SeatCubit(),
  );
}

_initSearchDependencies() async {
  getIt.registerFactory<SearchCubit>(
    () => SearchCubit(),
  );
}

_initBookingDependencies() async {
  getIt.registerFactory<BookingCubit>(
    () => BookingCubit(),
  );
}


_initRegisterDependencies() {
  // init data source
  getIt.registerLazySingleton(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>()),
  );

  // init repository
  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );
  getIt.registerLazySingleton<AuthRemoteRepository>(
    () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()),
  );

  // register use usecase
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerLazySingleton<UploadImageUsecase>(
    () => UploadImageUsecase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt(),
      uploadImageUsecase: getIt(),
    ),
  );
}

_initLoginDependencies() async {
  getIt.registerLazySingleton<TokenSharedPrefs>(
    () => TokenSharedPrefs(getIt<SharedPreferences>()),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<OnboardingCubit>()),
  );
}

_initOnboardingScreenDependencies() async {
  getIt.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(getIt<LoginBloc>()),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      getIt<AuthRemoteRepository>(),
      getIt<TokenSharedPrefs>(),
    ),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUseCase: getIt<LoginUseCase>(),
    ),
  );
}