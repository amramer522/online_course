import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';
import 'states.dart';

class MonthsScreen extends StatelessWidget {
  const MonthsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build");
    return BlocProvider(
      create: (context) => MonthsCubit(),
      child: Builder(builder: (context) {
        MonthsCubit cubit = BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("Months App"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: cubit.numberController,
                decoration: InputDecoration(labelText: "Enter month number"),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    cubit.getMonthName();
                  },
                  child: Text("Get")),
              SizedBox(
                height: 16,
              ),
              BlocBuilder<MonthsCubit, MonthsStates>(
                builder: (context, state) {
                  print("BlocBuilder");
                  return Text(cubit.monthName);
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
