import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // int count = 0;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterController(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterController = context.read<CounterController>();
    return Scaffold(
      appBar: AppBar(title: Text('State Management Part One')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CounterController>(
              builder: (context, counter, child) {
                return Text('${counter.count}');
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
          context.read<CounterController>().increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterController = context.read<CounterController>();
    return Scaffold(
      appBar: AppBar(title: Text('Profile Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CounterController>(
              builder: (context, counter, child) {
                return Text('${counter.count}');
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
          Provider.of<CounterController>(context, listen: false).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterController = context.read<CounterController>();
    return Scaffold(
      appBar: AppBar(title: Text('Settings Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CounterController>(
              builder: (context, counter, child) {
                return Text('${counter.count}');
              },
            ),
          ),
        ],
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
