import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/item_baby.dart';
import 'cubit.dart';
import 'states.dart';

class BabiesView extends StatelessWidget {
  const BabiesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // cascade operator
    return BlocProvider(
      create: (context) => BabiesCubit()
        ..getBabies()
        ..printData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Baby Images"),
        ),
        body: BlocBuilder<BabiesCubit, BabiesStates>(
          builder: (context, state) {

            if (state is GetBabiesLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetBabiesFailedState) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.message),
                    ElevatedButton(
                        onPressed: () {
                          BabiesCubit cubit = BlocProvider.of(context);
                          cubit.getBabies(isSuccess: true);
                        }, child: const Text("Try Again"))
                  ],
                ),
              );
            } else if (state is GetBabiesSuccessState) {
              return GridView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: state.list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 195 / 300),
                  itemBuilder: (context, index) => ItemBaby(
                        model: state.list[index],
                      ));
            } else {
              return const Text("Something Wrong");
            }
          },
        ),
      ),
    );
  }
}
