// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i497;

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mymanislier/app/controllers/app_controller.dart' as _i181;
import 'package:mymanislier/app/controllers/auth_controller.dart' as _i92;
import 'package:mymanislier/app/controllers/home_controller.dart' as _i105;
import 'package:mymanislier/app/controllers/setting_controller.dart' as _i1047;
import 'package:mymanislier/app/data/services/authService/auth_service.dart'
    as _i977;
import 'package:mymanislier/app/data/services/common/socket_service.dart'
    as _i484;
import 'package:mymanislier/app/utils/helpers/injectable%20properties/injectable_properties.dart'
    as _i515;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.pref(),
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i181.AppController>(() => _i181.AppController());
    gh.lazySingleton<_i92.AuthController>(
      () => _i92.AuthController(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i105.HomeController>(() => _i105.HomeController());
    gh.lazySingleton<_i1047.SettingController>(
        () => _i1047.SettingController());
    gh.lazySingleton<_i484.SocketService>(() => _i484.SocketService());
    gh.lazySingleton<_i977.AuthService>(
        () => _i977.AuthService(gh<_i361.Dio>()));
    gh.lazySingleton<_i977.RefreshTokenService>(
        () => _i977.RefreshTokenService(gh<_i361.Dio>()));
    await gh.factoryAsync<_i497.Directory>(
      () => registerModule.temporaryDirectory(),
      instanceName: 'temporary',
      preResolve: true,
    );
    await gh.factoryAsync<_i497.Directory>(
      () => registerModule.documentDirectory(),
      instanceName: 'document',
      preResolve: true,
    );
    gh.lazySingleton<_i515.AppDirectory>(() => _i515.AppDirectory(
          temporaryDirectory: gh<_i497.Directory>(instanceName: 'temporary'),
          documentDirectory: gh<_i497.Directory>(instanceName: 'document'),
        ));
    return this;
  }
}

class _$RegisterModule extends _i515.RegisterModule {}
