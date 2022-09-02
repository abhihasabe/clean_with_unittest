import 'package:clean_unittest/feature/domain/usecases/splash_usecase.dart';
import 'package:bloc/bloc.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashUseCase? splashUseCase;

  SplashCubit({this.splashUseCase}) : super(SplashInitial());

  Future<void> checkAccount() async {
    try {
      splashUseCase?.invoke().then((account) {
        if (account.toString().isNotEmpty) {
          emit(SplashToHome());
        } else {
          emit(SplashToWelcome());
        }
      });
    } catch (_) {
      emit(SplashToWelcome());
    }
  }
}
