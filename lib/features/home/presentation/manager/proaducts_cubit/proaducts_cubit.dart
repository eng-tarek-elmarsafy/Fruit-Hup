import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'proaducts_state.dart';

class ProaductsCubit extends Cubit<ProaductsState> {
  ProaductsCubit() : super(ProaductsInitial());
}
