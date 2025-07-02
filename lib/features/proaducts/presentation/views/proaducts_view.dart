import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/helper/get_it_setup.dart';
import 'package:fruit_hup/features/home/domain/repos/proaduct_repo.dart';
import 'package:fruit_hup/features/home/presentation/manager/proaducts_cubit/proaducts_cubit.dart';
import 'package:fruit_hup/features/proaducts/presentation/views/widgets/proaducts_view_body.dart';

class ProaductsView extends StatelessWidget {
  const ProaductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProaductsCubit(getIt.get<ProaductRepo>()),
      child: const ProaductsViewBlocBuilder(),
    );
  }
}

class ProaductsViewBlocBuilder extends StatefulWidget {
  const ProaductsViewBlocBuilder({super.key});

  @override
  State<ProaductsViewBlocBuilder> createState() =>
      _ProaductsViewBlocBuilderState();
}

class _ProaductsViewBlocBuilderState extends State<ProaductsViewBlocBuilder> {
  @override
  void initState() {
    BlocProvider.of<ProaductsCubit>(context).getProaducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProaductsCubit, ProaductsState>(
      builder: (context, state) {
        if (state is ProaductsSuccess) {
          return  ProaductsViewBody(proaducts: state.proaducts,);
        } else if (state is ProaductsFailuer) {
          return Center(child: Text(state.err));
        }
        return const Center(child: Text('Loading'));
      },
    );
  }
}
