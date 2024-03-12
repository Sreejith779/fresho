import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresho/features/homePage/bloc/home_bloc.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
      listenWhen: (previous,current)=> (current is HomeActionState),
      buildWhen: (previous,current)=>(current is !HomeActionState),
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
       switch(state.runtimeType){
         case HomeLoadingState:
           return const Center(child: CircularProgressIndicator());
           break;
         case HomeLoadedState:
           final loadedState = state as HomeLoadedState;
           return Scaffold(
             body: Container(
                 margin: const EdgeInsets.all(10),
                 child: GridView.count(
                   crossAxisCount: 2,
                   children: List.generate(
                       loadedState.products.length, (index) => Card()),
                 )
             ),
           );
         default:
           return const SizedBox(child: Center(
             child: Text("something went wrong"),
           ),);
       }
      },
    );
  }
}
