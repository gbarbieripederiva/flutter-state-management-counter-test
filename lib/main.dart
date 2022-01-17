import 'package:binder/binder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tests/widgets/binder_counter.dart';
import 'package:flutter_tests/widgets/bloc_counter/counter.dart';
import 'package:flutter_tests/widgets/flutter_commands_counter.dart';
import 'package:flutter_tests/widgets/getit_counter.dart';
import 'package:flutter_tests/widgets/getx_counter.dart';
import 'package:flutter_tests/widgets/inherited_counter.dart';
import 'package:flutter_tests/widgets/mobx_counter.dart';
import 'package:flutter_tests/widgets/my_statefull_widget.dart';
import 'package:flutter_tests/widgets/provider_counter.dart';
import 'package:flutter_tests/widgets/redux_counter.dart';
import 'package:flutter_tests/widgets/riverpod_counter.dart';
import 'package:flutter_tests/widgets/state_rebuilder_counter.dart';
import 'package:flutter_tests/widgets/triple_patter_counter.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  GetIt.instance.registerSingleton<CounterValueNotifier>(CounterValueNotifier());

  runApp(
    const BinderScope(
      child: ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(fontSize: 20);
    return MaterialApp(
      home: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("StatefullWidget", style: textStyle),
            const MyStateFullWidgetCounter(),
            Text("InheritedWidget", style: textStyle),
            const MyInheritedWidgetCounter(),
            Text("Provider", style: textStyle),
            const CounterWithProvider(),
            Text("Bloc", style: textStyle),
            const CounterWithBloc(),
            Text("Riverpod", style: textStyle),
            const CounterWithRiverpod(),
            Text("Redux", style: textStyle),
            const CounterWithRedux(),
            Text("GetIt", style: textStyle),
            const CounterWithGetIt(),
            Text("MobX", style: textStyle),
            CounterWithMobX(),
            Text("FlutterCommands", style: textStyle),
            CounterWithCommands(),
            Text("Binder", style: textStyle),
            const CounterWithBinder(),
            Text("GetX", style: textStyle),
            const CounterWithGetX(),
            Text("State_rebuilder", style: textStyle),
            const CounterWithStateRebuilder(),
            Text("Triple pattern", style: textStyle),
            const CounterWithTriplePattern(),
          ],
        ),
      ),
    );
  }
}
