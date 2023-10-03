import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:settle_loans/Components/icons.dart';
import 'package:settle_loans/Components/shared_prefs.dart';
import 'package:settle_loans/Constrains/Buttons.dart';
import 'package:settle_loans/Constrains/colors.dart';
import 'package:settle_loans/Constrains/iconbuton.dart';
import 'package:settle_loans/Constrains/textstyles.dart';
import 'package:settle_loans/Screens/Auth/login.dart';
import 'package:settle_loans/Screens/Client/client_data.dart';
import 'package:settle_loans/Screens/Client/paymentgateway.dart';
import 'package:settle_loans/Screens/Client/schedule_call.dart';

class ClientHome extends StatefulWidget {
  const ClientHome({super.key});

  @override
  State<ClientHome> createState() => _ClientHomeState();
}

class _ClientHomeState extends State<ClientHome> {
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
      } else {
        getDataFromDb();
      }
    });
  }

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
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        onPressed: Schedule_A_Call_Handler,
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
                          children: <Widget>[
                            IconNothing,
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'No added services',
                              style: LabelTextStyle2(),
                            )
                          ],
                        ),
                      ),

                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    KIconButton(
                        title: 'Debt free \nsolutions',
                        onPressed: () {},
                        Img: Test),
                    KIconButton(
                      title: 'Personal loan\nsettlement',
                      onPressed: () {},
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
                        onPressed: () {},
                        Img: IconHaressment),
                    KIconButton(
                      title: 'Credit card\nsettlement',
                      onPressed: () {},
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
                      title: 'Settlement &\nforeclosure',
                      onPressed: () {},
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
