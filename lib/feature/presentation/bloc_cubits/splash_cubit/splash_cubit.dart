import 'package:clean_unittest/feature/domain/usecases/splash_usecase.dart';
import 'package:bloc/bloc.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashUseCase? splashUseCase;

  SplashCubit({this.splashUseCase}) : super(SplashInitial());

  Future<void> checkAccount(String key) async {
    try {
      splashUseCase?.invoke(key).then((user) async {
        var userData = await user.right;
        if (userData != null) {
          emit(SplashToHome(message: userData));
        } else {
          emit(SplashToLogin(message: userData));
        }
      });
    } catch (_) {
      emit(const SplashToLogin());
    }
  }
}
