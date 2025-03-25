import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_perpus/modules/profile/src/bloc/profile_bloc.dart';
import 'package:flutter_perpus/modules/profile/src/bloc/profile_event.dart';

enum MenuState { home, cart, bookings, profile }

// Event
abstract class NavBarEvent {}

class ChangeMenuEvent extends NavBarEvent {
  final MenuState menu;
  ChangeMenuEvent(this.menu);
}

// State
class NavBarState {
  final MenuState selectedMenu;
  NavBarState(this.selectedMenu);
}

// Bloc
class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  final ProfileBloc profileBloc;

  NavBarBloc({required this.profileBloc}) : super(NavBarState(MenuState.home)) {
    on<ChangeMenuEvent>((event, emit) {
      emit(NavBarState(event.menu));
      if (event.menu == MenuState.profile) {
        profileBloc.add(FetchProfile());
      }
    });
  }
}
