import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/widgets/proaduct_item_loading.dart';
import 'package:fruit_hup/features/home/presentation/manager/proaducts_cubit/proaducts_cubit.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/home_view_app_bar.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/fruit_items_grid.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/hedar_best_sell.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/list_veiw_feature_widget.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/search_for.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<ProaductsCubit>(context).getTheBestSellingProaducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  HomeViewAppBar(),
                  SizedBox(height: 16),
                  SearchFor(),
                  SizedBox(height: 12),
                  ListVeiwFeatureWidget(),
                  SizedBox(height: 12),
                  HedarBestSell(),
                  SizedBox(height: 12),
                ],
              ),
            ),
            FruitItemGridViewBlocBuilder(),
          ],
        ),
      ),
    );
  }
}

class FruitItemGridViewBlocBuilder extends StatelessWidget {
  const FruitItemGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProaductsCubit, ProaductsState>(
      builder: (context, state) {
        if (state is ProaductsSuccess) {
          return FruitItemsGrid(proaducts: state.proaducts);
        } else if (state is ProaductsLoading) {
          return Skeletonizer.sliver(
            enabled: true,
            child: FruitItemsGrid(proaducts: getListOfDummyProducts()),
          );
        } else {
          return const Text('is failure');
        }
      },
    );
  }
}
