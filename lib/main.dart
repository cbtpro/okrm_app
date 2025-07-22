import 'package:flutter/cupertino.dart';
import './pages/index_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await FMTCObjectBoxBackend().initialise();
  // 初始化命名缓存数据库
  await FMTCStore('mapStore').manage.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      theme: const CupertinoThemeData(
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
        primaryColor: CupertinoColors.systemOrange,
      ),
      home: IndexPage(),
    );
  }
}
