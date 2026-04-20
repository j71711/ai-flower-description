// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ai/core/network/dio_client.dart' as _i108;
import 'package:ai/features/home/data/datasources/home_remote_data_source.dart'
    as _i282;
import 'package:ai/features/home/data/repositories/home_repository_data.dart'
    as _i1047;
import 'package:ai/features/home/domain/repositories/home_repository_domain.dart'
    as _i115;
import 'package:ai/features/home/domain/use_cases/home_use_case.dart' as _i377;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initHome({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i282.BaseHomeRemoteDataSource>(
      () => _i282.HomeRemoteDataSource(gh<_i108.DioClient>()),
    );
    gh.lazySingleton<_i115.HomeRepositoryDomain>(
      () => _i1047.HomeRepositoryData(gh<_i282.BaseHomeRemoteDataSource>()),
    );
    gh.lazySingleton<_i377.HomeUseCase>(
      () => _i377.HomeUseCase(gh<_i115.HomeRepositoryDomain>()),
    );
    return this;
  }
}
