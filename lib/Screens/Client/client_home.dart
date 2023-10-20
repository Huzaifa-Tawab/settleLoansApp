import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:settle_loans/Screens/Client/schedule_call.dart';
import '/Components/icons.dart';
import '/Components/shared_prefs.dart';
import '/Constrains/Buttons.dart';
import '/Constrains/colors.dart';
import '/Constrains/iconbuton.dart';
import '/Constrains/textstyles.dart';
import '/Screens/Auth/login.dart';
import '/Screens/Client/client_data.dart';
import '/Screens/Client/paymentgateway.dart';

import '/Screens/Client/services.dart';

class ClientHome extends StatefulWidget {
  const ClientHome({super.key});

  @override
  State<ClientHome> createState() => _ClientHomeState();
}

class _ClientHomeState extends State<ClientHome> {
  final db = FirebaseFirestore.instance;
  Map<String, dynamic> userDetails = {};
  bool myServices = false;
  @override
  void initState() {
    super.initState();
    getJson('userDetails').then((val) {
      if (val != null) {
        setState(() {
          userDetails = val;
        });
        // getdata();
      } else {
        getDataFromDb();
      }
    });
  }
  // getdata()async{
  //       String uid = FirebaseAuth.instance.currentUser!.uid;
  //     await db.collection("userDetails").doc(uid).get().then((value) => null);
  //   }
  // Schedule_A_Call_Handler() {
  //   Navigator.push(context,
  //       MaterialPageRoute(builder: ((context) => const ScheduleACall())));
  // }

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

  getDataFromDb() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('userDetails')
        .doc(uid)
        .get()
        .then((value) {
      putJson('userDetails', value.data());
      setState(() {
        userDetails = value.data()!;
        print(userDetails);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // print();

    return Scaffold(
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
                            'New Member',
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
                          child: IconPhone,
                        ),
                        padding: 10,
                        text: 'Schedule a call',
                        fontSize: 10,
                        borderWidth: 0.2,
                        radius: 20,
                        textColor: const Color(0xFFAAAAAA),
                        // onPressed: Schedule_A_Call_Handler,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScheduleACall()),
                          );
                        },
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Container(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          GoogleFonts.rubik().fontFamily,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '49 ₹',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontFamily:
                                          GoogleFonts.rubik().fontFamily,
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
                                          GoogleFonts.rubik().fontFamily,
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
                        height: 100, // Adjust the height as needed
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // ...userDetails['services']
                            //     .map(
                            //       (service) =>
                            //           KIconButton(title: service, Img: Test),
                            //     )
                            //     .toList()
                          ],
                        ),
                      ),

                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    KIconButton(title: 'Debt free \nsolutions', Img: Test),
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
                    onPressed: LogoutHandler, child: const Text('Logout')),
              ],
            ),
          ),
        ));
  }
}
