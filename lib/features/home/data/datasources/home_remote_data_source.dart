import 'package:ai/core/network/dio_client.dart';
import 'package:ai/core/network/gemmi.dart';
import 'package:injectable/injectable.dart';
import 'package:ai/features/home/data/models/home_model.dart';
import 'package:ai/core/errors/network_exceptions.dart';

abstract class BaseHomeRemoteDataSource {
  Future<HomeModel> getHome(String imagePath);
}

@LazySingleton(as: BaseHomeRemoteDataSource)
class HomeRemoteDataSource implements BaseHomeRemoteDataSource {
  final DioClient remoteDataSource;

  HomeRemoteDataSource(this.remoteDataSource);

  @override
  Future<HomeModel> getHome(String imagePath) async {
    try {
      final response = await remoteDataSource.postResponse(imagePath);
      return HomeModel(caption: response);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}