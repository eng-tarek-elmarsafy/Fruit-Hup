import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/helper/get_it_setup.dart';
import 'package:fruit_hup/features/home/domain/repos/proaduct_repo.dart';
import 'package:fruit_hup/features/home/presentation/manager/proaducts_cubit/proaducts_cubit.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/home_view_body.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   @override
//   void initState() {
//     BlocProvider.of<ProaductsCubit>(context).getTheBestSellingProaducts();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const HomeViewBody();
//   }
// }

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProaductsCubit(getIt.get<ProaductRepo>()),
      child: const HomeViewBody(),
    );
  }
}
