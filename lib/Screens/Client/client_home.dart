// import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:settle_loans/Screens/Client/client_data.dart';
import 'package:settle_loans/Screens/Client/schedule_call.dart';
import '/Components/icons.dart';
import '/Components/shared_prefs.dart';
import '/Constrains/Buttons.dart';
import '/Constrains/colors.dart';
import '/Constrains/iconbuton.dart';
import '/Constrains/textstyles.dart';
import '/Screens/Auth/login.dart';
// import '/Screens/Client/client_data.dart';
import '/Screens/Client/paymentgateway.dart';

// import '/Screens/Client/services.dart';
// import '/Screens/Client/schedule_call.dart';

class ClientHome extends StatefulWidget {
  const ClientHome({super.key});

  @override
  State<ClientHome> createState() => _ClientHomeState();
}

class _ClientHomeState extends State<ClientHome> {
  final db = FirebaseFirestore.instance;
  Map<String, dynamic> userDetails = {};
  bool myServices = false;
  bool gotdata = false;
  @override
  void initState() {
    super.initState();
    getJson('userDetails').then((val) {
      if (val != null) {
        print(val);
        setState(() {
          userDetails = val;
        });
        gotdata = true;
        // getdata();
      } else {
        getDataFromDb();
      }
    });
  }

  final _auth = FirebaseAuth.instance;
  dynamic user;
  late String userEmail;

  void getCurrentUserInfo() async {
    user = _auth.currentUser!;
    userEmail = user.email;
    print(userEmail);
  }

  set() async {
    FirebaseFirestore.instance
        .collection('userDetails')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      "name": userDetails['name'],
      "phone": userDetails['phoneNumber'],
      "status": isnewmember,
      "email": userEmail,
      "timestamp": userDetails['time'],
    }).then((value) => null);

    // FirebaseFirestore.instance
    //     .collection("callRequest")
    //     .doc(FirebaseAuth.instance.currentUser!.uid);
    // .set(userDetails);
    // .onError((e, _) => print("Error writing document: $e"));
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => ClientHome()));
  }

  // getdata()async{
  //       String uid = FirebaseAuth.instance.currentUser!.uid;
  //     await db.collection("userDetails").doc(uid).get().then((value) => null);
  //   }
  Schedule_A_Call_Handler() {
    Navigator.push(context,
        MaterialPageRoute(builder: ((context) => const ScheduleACall())));
  }

  LogoutHandler() {
    FirebaseAuth.instance.signOut().then((value) {
      GoogleSignIn().signOut();
      RemoveStoreData('userDetails');
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (Route<dynamic> route) => false);
    });
  }

  Future<void> getDataFromDb() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection('userDetails')
        .doc(uid)
        .get()
        .then((value) {
      putJson('userDetails', value.data());
      gotdata = true;

      // value.data()?['Paid'];
      setState(() {
        userDetails = value.data()!;
        print(userDetails);
      });
    });
  }

  // bool ispayactived = false;

  @override
  Widget build(BuildContext context) {
    return gotdata
        ? Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(300),
              child: AppBar(
                backgroundColor: Black,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${userDetails['name']}',
                                style: HeadingTextStyle3(),
                              ),
                              Text(
                                // userDetails['Paid']
                                true ? 'Old Member' : "New Member",
                                style: LabelTextStyle1(),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: IconBell,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Search...',
                          // Add a clear button to the search bar
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.search,
                              color: Black,
                            ),
                            onPressed: () => {},
                          ),
                          // Add a search icon or button to the search bar

                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // userDetails['Paid']
                          true
                              ? ButtonWithIcon(
                                  leading: Container(
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 40,
                                    height: 40,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFFFFFCF3),
                                      shape: OvalBorder(),
                                    ),
                                    child: IconPhone,
                                  ),
                                  padding: 10,
                                  text: 'Request a call',
                                  fontSize: 10,
                                  borderWidth: 0.2,
                                  radius: 20,
                                  textColor: const Color(0xFFAAAAAA),
                                  // onPressed: Schedule_A_Call_Handler,
                                  onPressed: () {
                                    getCurrentUserInfo();
                                    showDataAlert(context);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const ScheduleACall()),
                                    // );
                                  },
                                  color: Colors.transparent,
                                )
                              : ButtonWithIcon(
                                  leading: Container(
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 40,
                                    height: 40,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xFFFFFCF3),
                                      shape: OvalBorder(),
                                    ),
                                    child: IconPhone,
                                  ),
                                  padding: 10,
                                  text: 'Schedule a call',
                                  fontSize: 10,
                                  borderWidth: 0.2,
                                  radius: 20,
                                  textColor: const Color(0xFFAAAAAA),
                                  onPressed: Schedule_A_Call_Handler,

                                  // onPressed: () {},
                                  color: Colors.transparent,
                                ),
                          ButtonWithIcon(
                            leading: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(right: 10),
                              width: 40,
                              height: 40,
                              decoration: const ShapeDecoration(
                                color: Color(0xFFFFFCF3),
                                shape: OvalBorder(),
                              ),
                              child: IconBill,
                            ),
                            padding: 10,
                            text: 'Track you billing',
                            fontSize: 10,
                            borderWidth: 0.2,
                            radius: 20,
                            textColor: const Color(0xFFAAAAAA),
                            onPressed: () {},
                            color: Colors.transparent,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            body: RefreshIndicator(
              onRefresh: () {
                return getDataFromDb();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      // userDetails['Paid']
                      true
                          ? const SizedBox()
                          : Container(
                              padding: const EdgeInsets.all(20),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFFDC60),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome Onboard!",
                                    style: PrimaryTextStyle(),
                                  ),
                                  Text(
                                    "Lets us set up a call with your financial advisor.",
                                    style: PrimaryTextStyle(),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'A ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  fontFamily:
                                                      GoogleFonts.rubik()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '49 ₹',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  fontFamily:
                                                      GoogleFonts.rubik()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    ' fee is being charged by the company to gauge the clients commitment towards loan settlement and determine their seriousness in the process.',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  fontFamily:
                                                      GoogleFonts.rubik()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Paymentgateway()),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            shape: const StadiumBorder()),
                                        child: const Icon(Icons.arrow_forward),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'My Services',
                          style: PrimaryTextStyle(),
                        ),
                      ),
                      // Horizontal Scroll Container
                      myServices
                          ? const SizedBox(
                              height: 100, // Adjust the height as needed
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[],
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 100,
                              width: 5000, // Adjust the height as needed
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    true
                                        ? SizedBox(
                                            width: 300,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icontelescop,
                                                Text(
                                                  'No added services',
                                                  style: LabelTextStyle1(),
                                                ),
                                              ],
                                            ),
                                          )
                                        : userDetails['services'].map(
                                            (service) => Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10, left: 2),
                                              child: KIconButton(
                                                  title: service, Img: Test),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),

                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Other Services',
                          style: PrimaryTextStyle(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KIconButton(
                              title: 'Debt free \nsolutions', Img: Test),
                          KIconButton(
                            title: 'Personal loan\nsettlement',
                            Img: Iconsettlement,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KIconButton(
                              title: 'Anti\n-harassment\nservices',
                              Img: IconHaressment),
                          KIconButton(
                            title: 'Credit card\nsettlement',
                            Img: Iconcreditcard,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KIconButton(
                            title: 'Settlement &\nforeclosure',
                            Img: Iconfile,
                          ),
                        ],
                      ),

                      ElevatedButton(
                          onPressed: LogoutHandler,
                          child: const Text('Logout')),
                    ],
                  ),
                ),
              ),
            ))
        : const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
  }
}

showDataAlert(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            top: 10.0,
          ),
          content: SizedBox(
            height: 250,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/CheckCircle.png'),
                // SizedBox(
                //   height: 10,
                // ),
                const Divider(
                  thickness: 2,
                  endIndent: 45,
                  indent: 45,
                ),
                const Text(
                    'Thank you for booking\n you will hear from our\n execuitive shortly'),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
