import 'package:bybuapp/app/injection_container.dart';
import 'package:bybuapp/features/auth/bloc/auth_bloc.dart';
import 'package:bybuapp/pages/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
} 

class _AppState extends State<App> {
  @override
  void initState() {
    initializeDependencies();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Paydeal',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: AppRouter.onGenerateRoutes,
          initialRoute: Routes.splash),
    );
  }
}