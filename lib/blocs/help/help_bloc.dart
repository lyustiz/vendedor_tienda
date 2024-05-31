import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/entities/help.dart';
import 'package:vendedor_tienda/repository/help_repository.dart';

part 'help_event.dart';
part 'help_state.dart';

class HelpBloc extends Bloc<HelpEvent, HelpState> {
  HelpRepository rep = HelpRepository();

  HelpBloc() : super(HelpInitial()) {
    on<GetHelp>((event, emit) => _onGetHelp(event, emit));
  }

  void _onGetHelp(event, emit) async {
    emit(HelpLoading());
    try {
      final Help help = await rep.selectHelp(event.screen);
      emit(HelpLoaded(help));
    } catch (e) {
      emit(HelpError());
    }
  }

  dispose() {
    HelpBloc().close();
  }
}
