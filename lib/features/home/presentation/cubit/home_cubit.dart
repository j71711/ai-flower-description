import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai/features/home/domain/use_cases/home_use_case.dart';
import 'package:ai/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase _homeUseCase;

  HomeCubit(this._homeUseCase) : super(const HomeInitialState());

  void changeImage(int index) {
    if (state is HomeSuccessState) {
      emit(HomeSuccessState(
        result: (state as HomeSuccessState).result,
        selectedIndex: index,
      ));
    } else if (state is HomeErrorState) {
      emit(HomeErrorState(
        message: (state as HomeErrorState).message,
        selectedIndex: index,
      ));
    } else if (state is HomeLoadingState) {
      emit(HomeLoadingState(selectedIndex: index));
    } else {
      emit(HomeInitialState(selectedIndex: index));
    }
  }

  Future<void> getHomeMethod(String imagePath) async {
    if (state is HomeLoadingState) return;

    emit(HomeLoadingState(selectedIndex: state.selectedIndex));

    final result = await _homeUseCase.getHome(imagePath);

    result.when(
      (data) {
        emit(HomeSuccessState(
          result: data,
          selectedIndex: state.selectedIndex,
        ));
      },
      (error) {
        emit(HomeErrorState(
          message: error.message,
          selectedIndex: state.selectedIndex,
        ));
      },
    );
  }

  @override
  Future<void> close() {
    return super.close();
  }
}