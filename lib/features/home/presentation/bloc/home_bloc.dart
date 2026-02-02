import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_welcome_message.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetWelcomeMessage getWelcomeMessage;

  HomeBloc({required this.getWelcomeMessage}) : super(HomeInitial()) {
    on<GetWelcomeMessageEvent>((event, emit) async {
      emit(HomeLoading());
      final failureOrMessage = await getWelcomeMessage(const NoParams());
      failureOrMessage.fold(
            (failure) => emit(HomeError(message: failure.message)),
            (message) => emit(HomeLoaded(message: message)),
      );
    });
  }
}
