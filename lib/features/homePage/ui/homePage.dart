import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresho/dataModel/wishList.dart';
import 'package:fresho/features/homePage/bloc/home_bloc.dart';
import 'package:fresho/features/homePage/ui/productTile.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => (current is HomeActionState),
      buildWhen: (previous, current) => (current is! HomeActionState),
      listener: (context, state) {
        if (state is WishListedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("item wishlisted")));
        } else if (state is CartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Item added")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Skeletonizer(
              ignoreContainers: false,
              enabled: true,
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(6, (index) => Container()),
              ),
            );
            break;
          case HomeLoadedState:
            final loadedState = state as HomeLoadedState;
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    pinned: true,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    flexibleSpace: SearchBar(
                      hintText: "Search",
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const Banners(),
                        GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          children: List.generate(
                            loadedState.products.length,
                                (index) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey.withOpacity(0.1),
                              ),
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  ProductTile(
                                    productModel: loadedState.products[index],
                                    homeBloc: homeBloc,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );

          default:
            return const SizedBox(
              child: Center(
                child: Text("something went wrong"),
              ),
            );
        }
      },
    );
  }
}
