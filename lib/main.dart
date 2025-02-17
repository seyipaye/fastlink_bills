// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pwa_install/pwa_install.dart';

import 'core/app_routes.dart';
import 'domain/app_shared_prefs.dart';
import 'domain/providers/auth_api_provider.dart';
import 'domain/repositories/app_repo.dart';
import 'domain/repositories/auth_repo.dart';
import 'presentation/utils/theme.dart';

var initialRoute = Routes.splash;
final appDebugMode = false.obs;

Future _initializeUser() async {
  // Create App Sheared Pref
  Get.put<AppSharedPrefs>(await AppSharedPrefs.create());
  // Check if there is a User
  final user = AppSharedPrefs.instance.user;
  if (user != null) {
    //initialRoute = Routes.home;
  }
}

Future _initializeFirebase() async {
  /* await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');

  //FirebaseAnalytics analytics = await FirebaseAnalytics.instance;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//Firebase messaging
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  await FirebaseMessaging.instance.subscribeToTopic('foodelo');

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'foodelo_id_4', // id
    'Important transaction notification', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.max, // importance must be at low or higher level
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel); */

  //TODO remove
  // Only call clearSavedSettings() during testing to reset internal values.
}

/* Future _initializeSentry() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://40c3e5ff231b41fd81b72c4336a08dca@o1418010.ingest.sentry.io/6762501';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(MyApp()),
  );
} */

// firebase background message handler
/* Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('A Background message just showed up :  ${message.messageId}');
  debugPrint('A Background message for :  ${message.data['user']}');

  //LocalNotificationService.vendorDisplay(message);
  /* if (message.data['user'] == "Vendor")
    LocalNotificationService.vendorDisplay(message);
  else*/

  LocalNotificationService.display(message);
} */

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await _initializeFirebase();

  await _initializeUser();

  // Add this
  PWAInstall().setup(installCallback: () {
    debugPrint('APP INSTALLED!');
  });

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    appDebugMode.value = kDebugMode;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 877),
      minTextAdapt: true,
      splitScreenMode: true,
    );

    return GetMaterialApp(
      title: 'FastLink Bills',
      debugShowCheckedModeBanner: false,
      //initialRoute: Routes.login,
      initialRoute: initialRoute,
      initialBinding: BindingsBuilder(
        () {
          // It is mandatory for all of these to be initialized for the effectual running of the app

          // T for Thanks

          /*
          Please note:
          Auth Repository & Provider are stand alone
          App Repository & Provider depends on them 
          */

          Get.put<AuthRepository>(AuthRepository(), permanent: true);
          Get.put<AppRepository>(AppRepository(), permanent: true);
          Get.lazyPut<AuthProvider>(() => AuthProvider(), fenix: true);
        },
      ),
      getPages: AppPages.routes,
      theme: getLightTheme(),
    );
  }
}
