import 'package:citysync/app/helper/all_imports.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

RxMap firebaseUser = RxMap();
void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env['apiKey'] ?? "",
      appId: dotenv.env['appId'] ?? "",
      messagingSenderId: dotenv.env['messagingSenderId'] ?? "",
      projectId: dotenv.env['projectId'] ?? "",
      storageBucket: dotenv.env['storageBucket'] ?? "",
    ),
  );
  apiKeys = {
    "gemini": {
      "apis": [dotenv.env['geminiApi']],
      "index": 0,
    },
    "unsplash": {
      "apis": [dotenv.env['unsplashApi']],
      "index": 0,
    },
  };
  initializeSize(360, 800);
  configureEasyLoading();

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorStyle.neutralWhite,
      ),
      alignment: Alignment.center,
      child: AppText(
        text: 'Error!\n${details.exception}',
        style: TextStyle(color: ColorStyle.greyscale900),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      ),
    );
  };

  runApp(
    GetMaterialApp(
      title: "CitySync",
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
