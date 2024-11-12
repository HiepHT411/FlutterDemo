import 'package:flutter/material.dart';
import 'package:xam_app/model/quiz.dart';
import 'package:xam_app/model/result.dart';
import 'package:xam_app/service/QuizService.dart';
import 'package:xam_app/service/tabbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teckcombank',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: MyHomePage(title: 'Flutter Home Page')
      home: const HiFlutter(title: 'Techcombank'),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

class HiFlutter extends StatefulWidget {
  final String title;
  const HiFlutter({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the background color of the scaffold
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Set the background color of the app bar
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        // Set the title of the app bar
        title: Text(title),
        titleTextStyle: const TextStyle(
          fontSize: 24,          // Set font size
          fontWeight: FontWeight.bold, // Set font weight
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        // child: const QuizApp(),
      ),
    );
  }

  @override
  State<HiFlutter> createState() => _HiFlutter();
}
// ================ Drawer ================
class _HiFlutter extends State<HiFlutter> {
  int selectedIdx = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> widgetOpts = <Widget> [Text('Index 0: Home', style: optionStyle), Text('Index 1: Transfer', style: optionStyle), Text('Index 2: Saving Plans', style: optionStyle), 
    Text('Index 3: Bonus & Reward', style: optionStyle), Text('Index 4: Quiz', style: optionStyle), Text('Index 5: Grab', style: optionStyle,)];

  void onItemTapped (int index) {
    setState(() {
      selectedIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder(builder: (context) {
          return IconButton(onPressed: () {Scaffold.of(context).openDrawer();}, icon: const Icon(Icons.menu));
        })
      ),
      body: Center(child: widgetOpts[selectedIdx],),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(decoration: BoxDecoration(color: Colors.white), child: Text('Hi, User')),
            ListTile(
              title: const Text('Home'),
              selected: selectedIdx == 0,
              onTap: () {
                onItemTapped(0);
                Navigator.pop(context);
              }
            ),
            ListTile(
                title: const Text('Transfer'),
                selected: selectedIdx == 1,
                onTap: () {
                  onItemTapped(1);
                  Navigator.pop(context);
                }
            ),
            ListTile(
                title: const Text('Saving Plans'),
                selected: selectedIdx == 2,
                onTap: () {
                  onItemTapped(2);
                  Navigator.pop(context);
                }
            ),
            ListTile(
                title: const Text('Bonus & Reward'),
                selected: selectedIdx == 3,
                onTap: () {
                  onItemTapped(3);
                  Navigator.pop(context);
                }
            ),
            ListTile(
              title: const Text('Quiz'),
              selected: selectedIdx == 4,
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const QuizApp()));
              }
            ),
            ListTile(
                title: const Text('Grab'),
                selected: selectedIdx == 5,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const TabBarDemo()));
                }
            )
          ],
        ),
      ),
    );
  }
}

