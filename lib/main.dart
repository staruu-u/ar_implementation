import 'package:ar_implementation/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'resources/stylo.dart';
import 'firebase_options.dart';
import 'screens/sign_in.dart';

Future main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final Stylo themeData = Stylo();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APS Smart Parking',
      theme: themeData.mainTheme(),
      home: StreamBuilder<User?>(
        stream: _auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            if (user == null) {
              // User is not logged in, show the login page
              return const SignInPage();
            } else {
              // User is logged in, take them to verify email
              return const HomePage();
            }
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );

  }
}

// import 'package:flutter/material.dart';

// import 'menu_screen.dart';
// // import 'screens/api_screen.dart';
// // import 'screens/loader_screen.dart';
// import 'components/simple_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Unity Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const MenuScreen(),
//         '/simple': (context) => const SimpleScreen(),
//       },
//     );
//   }
// }

// // USE CODE FROM ABOVE

// // import 'package:flutter/material.dart';
// // import 'dart:io';

// // import 'package:camera/camera.dart';
// // import 'package:flutter_unity_widget/flutter_unity_widget.dart';


// // void main() {
// //   runApp(
// //     const MaterialApp(
// //       home: UnityDemoScreen(),
// //     ),
// //   );
// // }

// // class UnityDemoScreen extends StatefulWidget {
// //   const UnityDemoScreen({Key? key}) : super(key: key);

// //   @override
// //   State<UnityDemoScreen> createState() => _UnityDemoScreenState();
// // }

// // class _UnityDemoScreenState extends State<UnityDemoScreen> {
// //   static final GlobalKey<ScaffoldState> _scaffoldKey =
// //       GlobalKey<ScaffoldState>();
// //   UnityWidgetController? _unityWidgetController;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       key: _scaffoldKey,
// //       body: SafeArea(
// //         bottom: false,
// //         child: WillPopScope(
// //           onWillPop: () async {
// //             // Pop the category page if Android back button is pressed.
// //             return true;
// //           },
// //           child: Container(
// //             color: Colors.yellow,
// //             child: UnityWidget(
// //               onUnityCreated: onUnityCreated, // IMPORTANT: check how it's getting initialized
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   // Callback that connects the created controller to the unity controller
// //   void onUnityCreated(controller) {
// //     _unityWidgetController = controller;
// //   }
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return const MaterialApp(
// //       title: 'Flutter Camera Demo',
// //       home: HomeScreen(),
// //     );
// //   }
// // }

// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({Key? key}) : super(key: key);

// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   XFile? image;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SafeArea(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //           children: [
// //             image == null
// //                 ? const Icon(Icons.image)
// //                 : Image.file(File(image!.path)),
// //             Padding(
// //               padding: const EdgeInsets.all(24.0),
// //               child: TextButton(
// //                 style: TextButton.styleFrom(
// //                   backgroundColor: Colors.green,
// //                 ),
// //                 onPressed: () {
// //                   _showCamera();
// //                 },
// //                 child: const Text("Take Picture",
// //                     style: TextStyle(color: Colors.white)),
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
  
// // void _showCamera() async {
// //   final cameras = await availableCameras();
// //   final camera = cameras.first;
// //   if (!mounted) return;
// //   final result = await Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //           builder: (context) => TakePicturePage(camera: camera)));
// //   if (result != null) {
// //     setState(() {
// //       image = result;
// //     });
// //   }
// //   }
// // }

// // class TakePicturePage extends StatefulWidget {
// //   final CameraDescription camera;

// //   const TakePicturePage({Key? key, required this.camera}) : super(key: key);

// //   @override
// //   State<TakePicturePage> createState() => _TakePicturePageState();
// // }

// // class _TakePicturePageState extends State<TakePicturePage> {
// //   late CameraController _cameraController;
// //   late Future _initializeCameraControllerFuture;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _cameraController =
// //         CameraController(widget.camera, ResolutionPreset.max);
// //     _initializeCameraControllerFuture = _cameraController.initialize();
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       floatingActionButton: FloatingActionButton(
// //           child: const Icon(Icons.camera),
// //           onPressed: () => _takePicture(context)),
// //       body: FutureBuilder(
// //         future: _initializeCameraControllerFuture,
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.done) {
// //             return SizedBox(
// //                 width: MediaQuery.of(context).size.width,
// //                 height: MediaQuery.of(context).size.height,
// //                 child: CameraPreview(_cameraController));
// //           } else {
// //             return const Center(child: CircularProgressIndicator());
// //           }
// //         },
// //       ),
// //     );
// //   }
// //     void _takePicture(BuildContext context) async {
// //     try {
// //       if (!_cameraController.value.isTakingPicture) {
// //         XFile image = await _cameraController.takePicture();
// //         if (!mounted) return;
// //         Navigator.pop(context, image);
// //       } else {
// //         ScaffoldMessenger.of(context)
// //           ..hideCurrentSnackBar()
// //           ..showSnackBar(
// //               const SnackBar(content: Text('Already taking a picture.')));
// //       }
// //     } catch (e) {
// //       debugPrint('$e');
// //     }
// //     @override
// //     void dispose() {
// //       _cameraController.dispose();
// //       super.dispose();
// //     }
// //   }
// // }