import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/core/cache_helper.dart';
import 'package:online_course/screens/counter/states.dart';

import 'cubit.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build");
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Builder(builder: (context)
      {

        CounterCubit cubit = BlocProvider.of(context);

        return Scaffold(
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      onPressed: (){
                        cubit.plus();
                      },
                      child: Icon(Icons.add),
                      mini: true,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    BlocBuilder<CounterCubit, CounterStates>(
                      builder: (context, state) {
                        print("BlocBuilder");
                        return Text(
                          "${cubit.count}",
                          style: TextStyle(fontSize: 30),
                        );
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      onPressed: (){
                        cubit.minus();
                      },
                      child: Icon(Icons.remove),
                      mini: true,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
