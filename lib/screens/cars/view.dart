import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/item_car.dart';
import 'cubit.dart';
import 'states.dart';

class CarsScreen extends StatelessWidget {
  const CarsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarsCubit(),
      child: Builder(builder: (context) {
        CarsCubit cubit = BlocProvider.of(context);
        cubit.getCars();
        return Scaffold(
          appBar: AppBar(title: const Text("My Cars")),
          body: BlocBuilder<CarsCubit, CarsStates>(
            builder: (context, state) {
              if (state is GetCarsLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetCarsFailedState) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Failed To Get Cars Try Again"),
                      ElevatedButton(
                          onPressed: () {
                            cubit.getCars(isSuccess: true);
                          },
                          child: const Text("Try Again"))
                    ],
                  ),
                );
              }

              return GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: cubit.cars.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 165 / 210),
                itemBuilder: (context, index) =>
                    ItemCar(model: cubit.cars[index]),
              );
            },
          ),
        );
      }),
    );
  }
}
