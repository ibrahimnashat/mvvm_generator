///[Implementation]
import 'package:eitherx/eitherx.dart';
import 'package:example/core/base_response.dart';
import 'package:example/core/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:example/core/base_use_case.dart';
import 'package:example/settings/domain/repository/settings_repository.dart';
import 'package:example/settings/domain/requests/get_addresses_request.dart';
import 'package:example/settings/domain/entities/user_entity.dart';
import 'package:example/settings/domain/entities/user_entity.dart';
import 'package:example/settings/domain/entities/address_entity.dart';
import 'package:example/settings/domain/entities/otp_entity.dart';
import 'package:example/settings/domain/entities/otp_entity.dart';

///[GetAddressesUseCase]
///[Implementation]
@injectable
class GetAddressesUseCase implements BaseUseCase<Future<Either<Failure, BaseResponse<List<AddressEntity>?>>>,GetAddressesRequest>{
final SettingsRepository repository;
const GetAddressesUseCase(
this.repository,
);

@override
Future<Either<Failure, BaseResponse<List<AddressEntity>?>>> execute({GetAddressesRequest? request,}) async {
return await repository.getAddresses
(page: request!.page,limit: request!.limit,userId: request!.userId,);
}

}

