import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vendedor_tienda/models/theme.dart';
import 'package:vendedor_tienda/repository/preferences_repository.dart';

part 'preferences_event.dart';
part 'preferences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  final PreferencesRepository preferencesRepository;

  PreferencesBloc({required this.preferencesRepository})
      : super(PreferencesInitial()) {
    on<LoadPreferences>((event, emit) async {
      final String endpoint = await preferencesRepository.getEndPoint();
      emit(PreferenceLoaded(theme: Theme.dark, endpoint: endpoint));
    });

    on<UpdateTheme>((event, emit) async {
      preferencesRepository.setTheme(event.theme);
      final String endpoint = await preferencesRepository.getEndPoint();
      emit(PreferenceLoaded(theme: event.theme, endpoint: endpoint));
    });

    on<UpdateEndPoint>((event, emit) async {
      preferencesRepository.setEndPoint(event.empresa);
      emit(PreferenceLoaded(theme: Theme.dark, endpoint: event.empresa));
    });
  }
}
