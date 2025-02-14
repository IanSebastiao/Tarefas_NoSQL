import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:tarefas/firebase_options.dart';
import 'package:tarefas/presentation/pages/sprash_screen.dart';
import 'presentation/pages/home_page.dart'; // Certifique-se de que o ThemeProvider está no caminho correto.

// Desenvolvido por Ian

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Acessa o ThemeProvider para gerenciar o tema.
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // Tema claro.
      darkTheme: ThemeData.dark(), // Tema escuro.
      themeMode: themeProvider.themeMode, // Alterna entre claro e escuro.
      home: const SplashScreen(),
    );
  }
}
