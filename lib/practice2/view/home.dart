// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_cli/practice2/notification_services.dart';
// import 'package:firebase_cli/widgets/toast.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   NotificationServices services = NotificationServices();
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     services.requestNotificationPermission();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         actions: [
//           IconButton(
//             onPressed: () {
//               FirebaseAuth.instance.signOut();
//               googleSignIn.signOut();
//
//               Navigator.pushNamed(context, '/login');
//               showToast(message: "Sign Out");
//             },
//             icon: Icon(Icons.logout),
//           )
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 final firestore = FirebaseFirestore.instance;
//                 await firestore.collection('users').doc('1').set(
//                     {'username': "John", "address": "Karachi", "age": "26"});
//               },
//               child: Text('Create Data'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
///---------------------------///
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_cli/practice2/notification_services.dart';
// import 'package:firebase_cli/widgets/toast.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import '../services/authservice.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final NotificationServices notificationServices = NotificationServices();
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   final FirebaseAuthService _authService = FirebaseAuthService();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   String? _username;
//
//   @override
//   void initState() {
//     super.initState();
//     notificationServices.firebaseInit(context);
//     notificationServices.requestNotificationPermission();
//     _fetchUserName();
//     notificationServices.firebaseInit(context);
//     notificationServices.setupInteractMessage(context);
//     // notificationServices.isTokenRefresh();
//     notificationServices.getDeviceToken().then((value) {
//       print("Device Token");
//       print(value);
//     });
//   }
//
//   Future<void> _fetchUserName() async {
//     User? user = _auth.currentUser;
//     if (user != null) {
//       DocumentSnapshot userDoc =
//           await _firestore.collection('users').doc(user.uid).get();
//       setState(() {
//         _username = userDoc['username'];
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.blue,
//         actions: [
//           IconButton(
//             onPressed: () async {
//               await _authService.signOut();
//               // FirebaseAuth.instance.signOut();
//               // await googleSignIn.signOut();
//
//               Get.offAllNamed('/login');
//
//               showToast(message: "Sign Out");
//             },
//             icon: const Icon(Icons.logout),
//           ),
//         ],
//       ),
//       body: _username != null
//           ? Text(
//         'Hello, $_username!',
//         style: const TextStyle(
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//         ),
//       )
//           : const CircularProgressIndicator(),
//
//
//     );
//   }
// }
///---------------------------------//////
///
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cli/practice2/const.dart';
import 'package:firebase_cli/practice2/notification_services.dart';
import 'package:firebase_cli/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import '../services/authservice.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NotificationServices notificationServices = NotificationServices();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuthService _authService = FirebaseAuthService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);
  Weather? _weather;

  String? _username;

  @override
  void initState() {
    super.initState();
    notificationServices.firebaseInit(context);
    notificationServices.requestNotificationPermission();
    _fetchUserName();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    // notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value) {
      print("Device Token");
      print(value);

      _wf.currentWeatherByCityName("Karachi").then((w) {
        setState(() {
          _weather = w;
        });
      });
    });
  }

  Future<void> _fetchUserName() async {
    User? user = _auth.currentUser;
    if (user != null && !_authService.isPhoneAuth.value) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();
      setState(() {
        _username = userDoc['username'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/night.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(

          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: _username != null
              ? Text('Hello, $_username!',style: const TextStyle(color: Colors.white),)
              : const CircularProgressIndicator(
                  color: Colors.white,
                ),
          actions: [
            IconButton(
              onPressed: () async {
                await _authService.signOut();
                // FirebaseAuth.instance.signOut();
                // await googleSignIn.signOut();

                Get.offAllNamed('/login');

                showToast(message: "Sign Out");
              },
              icon: const Icon(Icons.logout,color: Colors.white,),
            ),
          ],
        ),
        body: buildUI(),
      ),
    );
  }

  Widget buildUI() {
    if (_weather == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          // mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 20,
            ),
            _locationHeaer(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            _dateTimeInfo(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            _weatherIcon(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            _currentTemp(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            _extraInfo(),
          ],
        ),
      ),
    );
  }

  Widget _locationHeaer() {
    return Text(_weather!.areaName ?? '',
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ));
  }

  Widget _dateTimeInfo() {
    DateTime now = _weather!.date!;
    return Column(
      children: [
        Text(
          DateFormat("h:m a").format(now),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateFormat("EEEE").format(now),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
                DateFormat("d.m.y").format(now),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        )
      ],
    );
  }

  Widget _weatherIcon() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'http://openweathermap.org/img/wn/${_weather?.weatherIcon}@4x.png'),
            ),
          ),
        ),
        Text(
          _weather!.weatherDescription ?? '',
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }

  Widget _currentTemp() {
    return Text(
      "Current Temperature ${_weather!.temperature!.celsius!.toStringAsFixed(0)} °C",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _extraInfo() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Max: ${_weather?.tempMax!.celsius!.toStringAsFixed(0)}°C ",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "Min: ${_weather?.tempMin!.celsius!.toStringAsFixed(0)}°C",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Wind: ${_weather?.windSpeed!.toStringAsFixed(0)}m/s",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "Humidity: ${_weather?.humidity!.toStringAsFixed(0)} %",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
