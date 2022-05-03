// import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/12_done_loading.dart';
import 'package:job_doc/pages/login/2_sign_in.dart';
import 'package:job_doc/pages/login/3_starting_process.dart';
import 'package:job_doc/services/auth_service.dart';
import 'package:job_doc/services/bottomnavi_service.dart';
import 'package:job_doc/services/login_process_service.dart';
import 'package:job_doc/services/user_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;

//안드로이드 포그라운드 메시지 퍼미션 설정
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.max,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var userToken = await messaging.getToken(); //로그인하고 나서 얻게하기

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
//퍼미션 설정
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
  // iOS 퍼미션 설정 (iOS에서는 foreground메시지가 아래 허락이 있어야만 받을 수 있음)
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );

  //안드로이드 퍼미션 설정

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  print(await messaging.getToken());
  // 겟 토근을
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => LoginProcessSerivce()),
        ChangeNotifierProvider(create: (context) => BtmNavProvider()),
        ChangeNotifierProvider(create: (context) => UserService())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        var notification = message.notification;
        var android = message.notification?.android;
        print(message.notification);
        print("111");

        // If `onMessage` is triggered with a notification, construct our own
        // local notification to show to users using the created channel.
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                // other properties...
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        fontFamily: 'Pretendard',
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SignIn(),
    );
  }
}
