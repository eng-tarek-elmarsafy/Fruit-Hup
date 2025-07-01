import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/features/home/presentation/manager/proaducts_cubit/proaducts_cubit.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/home_view_body.dart';

class HomeViewBodyBlocBuilder extends StatelessWidget {
  const HomeViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProaductsCubit, ProaductsState>(
      builder: (context, state) {
        if (state is ProaductsSuccess) {
          return HomeViewBody(proaducts: state.proaducts);
        } else if (state is ProaductsLoading) {
          return const Text('is Lodaing');
        } else {
          return const Text('is failure');
        }
      },
    );
  }
}
