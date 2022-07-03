import 'package:flutter/material.dart';
import 'package:youtube_hls/Providers/videoList.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: VideoList(),
        ),
      ],
      child: MaterialApp(
        title: 'Youtube',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
