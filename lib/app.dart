import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final CounterController counterController = CounterController();

class _MyAppState extends State<MyApp> {
  // int count = 0;
  //
  // void _increment() {
  //   count++;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('State Management Part One')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ListenableBuilder(
              listenable: counterController,
              builder: (context, child) {
                return Text('${counterController.count}');
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            child: Text('Profile Screen'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ListenableBuilder(
              listenable: counterController,
              builder: (context, child) {
                return Text('${counterController.count}');
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
            child: Text('Settings Screen'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("${counterController.count}"))],
      ),
    );
  }
}

/// Example: state management by Inherited widget
// class CounterController extends InheritedWidget {
//   final int count;
//   final void Function() increment;
//
//   CounterController({
//     super.key,
//     required this.count,
//     required super.child,
//     required this.increment,
//   });
//
//   static CounterController? of(BuildContext context) {
//     final CounterController? result =
//         context.dependOnInheritedWidgetOfExactType<CounterController>();
//     return result;
//   }
//
//   @override
//   bool updateShouldNotify(CounterController oldWidget) {
//     return oldWidget.child != count;
//   }
// }

/// Example: state management by Change Notifier
class CounterController extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}
