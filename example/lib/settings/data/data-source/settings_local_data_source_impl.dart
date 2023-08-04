import 'dart:convert';

import 'package:eitherx/eitherx.dart';
import 'package:example/core/failure.dart';
import 'package:example/settings/data/data-source/settings_local_data_source.dart';
import 'package:example/settings/models/settings_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

///[SettingsLocalDataSourceImpl]
///[Implementation]
@Injectable(as: SettingsLocalDataSource)
class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final SharedPreferences sharedPreferences;

  const SettingsLocalDataSourceImpl(
    this.sharedPreferences,
  );

  final _settings = "SETTINGS";

  @override
  Future<Either<Failure, Unit>> cacheSettings({
    required SettingsModel data,
  }) async {
    try {
      await sharedPreferences.setString(_settings, jsonEncode(data.toJson()));
      return const Right(unit);
    } catch (e) {
      return Left(Failure(999, 'Cache failure'));
    }
  }

  @override
  Either<Failure, SettingsModel> getCacheSettings() {
    try {
      final res = sharedPreferences.getString(_settings) ?? {};
      return Right(SettingsModel.fromJson(jsonDecode(res)));
    } catch (e) {
      return Left(Failure(999, 'Cache failure'));
    }
  }
}