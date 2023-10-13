import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:settle_loans/Constrains/Buttons.dart';
import 'package:settle_loans/Constrains/colors.dart';
import 'package:settle_loans/Constrains/textstyles.dart';
import 'package:settle_loans/Screens/Client/client_home.dart';
import '../../Components/icons.dart';
import '../../Constrains/textfields.dart';

final user = <String, dynamic>{
  'userType': 'client',
};

class ClientDataScreen1 extends StatelessWidget {
  ClientDataScreen1({super.key});
  TextEditingController _nameController = TextEditingController();
  TextEditingController _PhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    onButtonPressed() {
      user['name'] = _nameController.text;
      user['phoneNumber'] = _PhoneController.text;
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ClientDataScreen2()));
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: LogoBlack,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Step 1 of 3',
                      style: LabelTextStyle1(),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Let us get to know you.',
                      style: HeadingTextStyle2(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              TextField_1(
                controller: _nameController,
                txttype: TextInputType.name,
                label: 'Name',
                hint: 'Name',
              ),
              SizedBox(
                height: 35,
              ),
              TextField_1(
                controller: _PhoneController,
                txttype: TextInputType.number,
                label: 'Phone No.',
                hint: '91 XXXXXXXXXX',
              ),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: RoundedButton1(
                      text: 'Next Step', onPressed: onButtonPressed)),
            ],
          ),
        ),
      ),
    );
  }
}

class ClientDataScreen2 extends StatelessWidget {
  ClientDataScreen2({super.key});
  TextEditingController _DebtController = TextEditingController();
  TextEditingController _IncomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    onButtonPressed() {
      user['AmountOfDebt'] = _DebtController.text;
      user['MonthlyIncome'] = _IncomeController.text;
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ClientDataScreen3()));
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: LogoBlack,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Step 2 of 3',
                      style: LabelTextStyle1(),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Help us understand you better.',
                      style: HeadingTextStyle2(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              TextField_1(
                controller: _DebtController,
                txttype: TextInputType.number,
                label: 'Total Debt Amount',
                hint: '50,000',
              ),
              SizedBox(
                height: 35,
              ),
              TextField_1(
                controller: _IncomeController,
                txttype: TextInputType.number,
                label: 'Monthly Income',
                hint: '25,000',
              ),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: RoundedButton1(
                      text: 'Next Step', onPressed: onButtonPressed)),
            ],
          ),
        ),
      ),
    );
  }
}

class ClientDataScreen3 extends StatefulWidget {
  ClientDataScreen3({super.key});

  @override
  State<ClientDataScreen3> createState() => _ClientDataScreen3State();
}

class _ClientDataScreen3State extends State<ClientDataScreen3> {
  bool startprocess = true;
  bool harasment = false;
  setUserData() {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    final db = FirebaseFirestore.instance;
    db.collection('userDetails').doc(uid).set(user);
  }

  setStartProcess(val) {
    setState(() {
      startprocess = val;
    });
  }

  setHarasment(val) {
    setState(() {
      harasment = val;
    });
  }

  onButtonPressed() {
    user['facingHarassment'] = harasment;
    user['startSattlement'] = startprocess;

    setUserData();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ClientHome()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: LogoBlack,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Step 3 of 3',
                      style: LabelTextStyle1(),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Almost Done!',
                      style: HeadingTextStyle2(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                'Can you arrange Rs.2,000 - Rs.3,000 to start the settlement process?',
                style: LabelTextStyle1(),
              ),
              Row(
                children: [
                  Radio(
                      activeColor: Yellow,
                      value: true,
                      groupValue: startprocess,
                      onChanged: (e) {
                        setStartProcess(e);
                      }),
                  Text(
                    'Yes',
                    style: LabelTextStyle2(),
                  ),
                  Radio(
                      activeColor: Yellow,
                      value: false,
                      groupValue: startprocess,
                      onChanged: (e) {
                        setStartProcess(e);
                      }),
                  Text(
                    'No',
                    style: LabelTextStyle2(),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                'Are you facing harassment by recovery agent / banks ?',
                style: LabelTextStyle1(),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Radio(
                      activeColor: Yellow,
                      value: true,
                      groupValue: harasment,
                      onChanged: (e) {
                        setHarasment(e);
                      }),
                  Text(
                    'Yes',
                    style: LabelTextStyle2(),
                  ),
                  Radio(
                      activeColor: Yellow,
                      value: false,
                      groupValue: harasment,
                      onChanged: (e) {
                        setHarasment(e);
                      }),
                  Text(
                    'No',
                    style: LabelTextStyle2(),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: RoundedButton1(
                      text: 'Next Step', onPressed: onButtonPressed)),
            ],
          ),
        ),
      ),
    );
  }
}
