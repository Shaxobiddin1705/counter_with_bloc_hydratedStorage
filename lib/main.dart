import 'package:counter_with_bloc/blocs/bloc_observer.dart';
import 'package:counter_with_bloc/blocs/counter/counter_bloc.dart';
import 'package:counter_with_bloc/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());

  HydratedBlocOverrides.runZoned(
    blocObserver: MyBlocObserver(),
    storage: storage,
    () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Bloc Counter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}