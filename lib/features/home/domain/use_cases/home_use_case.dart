import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:ai/core/errors/failure.dart';
import 'package:ai/features/home/domain/entities/home_entity.dart';
import 'package:ai/features/home/domain/repositories/home_repository_domain.dart';


@lazySingleton
class HomeUseCase {
  final HomeRepositoryDomain _repositoryData;

  HomeUseCase(this._repositoryData);


   Future<Result<HomeEntity, Failure>> getHome(String imagePath) async {
    return _repositoryData.getHome(imagePath);
    
  }
}
