import 'package:betterrank/widgets/loading/bloc/loading_overlay_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoadingOverlayCubit extends Cubit<LoadingOverlayState> {
  LoadingOverlayCubit() : super(Waiting());

  void changeLoadingState({required bool isLoading}) =>
      emit(isLoading ? Loading() : Waiting());
}
