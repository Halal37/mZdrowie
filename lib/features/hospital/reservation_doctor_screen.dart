import 'package:admin_app/features/hospital_ward/time_of_the_visit/time_of_the_visit_screen.dart';
import 'package:admin_app/features/hospital_ward/widget/text_field.dart';
import 'package:admin_app/widgets/button_widget.dart';
import 'package:admin_app/widgets/doctor_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:admin_app/features/hospital/get_doctor_res.dart';

class ReservationDoctorScreen extends StatefulWidget {
  final int branchid;
  ReservationDoctorScreen({
    required this.branchid,
  });

  @override
  _ReservationDoctorScreenState createState() =>
      _ReservationDoctorScreenState();
}

class _ReservationDoctorScreenState extends State<ReservationDoctorScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Zmień datę',
          style: TextStyle(
            color: Color(0xFF263139),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFF263139),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 100.0, left: 50.0, right: 50.0),
              child: Text(
                "Szukać",
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xff263139),
                  fontSize: 24,
                  fontFamily: "Manrope",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextFieldTemplate(
                hintText: '',
                height: 2,
                colorBorder: Colors.white,
                colorInput: Colors.white70,
                colorText: Colors.black,
                marginVertical: 10,
                marginHorizontal: 40),
            Container(
              padding: EdgeInsets.only(top: 10.0, left: 60.0, right: 10.0),
              child: GetDoctor(number: 0, number2: widget.branchid),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0, left: 60.0, right: 10.0),
              child: GetDoctor(number: 1, number2: widget.branchid),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0, left: 60.0, right: 10.0),
              child: GetDoctor(number: 2, number2: widget.branchid),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0, left: 60.0, right: 10.0),
              child: GetDoctor(number: 3, number2: widget.branchid),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0, left: 60.0, right: 10.0),
              child: GetDoctor(number: 4, number2: widget.branchid),
            ),
            ButtonWidget(
              text: 'WYBRAĆ LIEKARZA',
              colorText: Color(0xFF263139),
              colorButton: Color(0xFFFEFEFE),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => VisitTimeScreen(
                    branchid: widget.branchid,
                    patientid: 1,
                    date: "",
                    date2: "",
                  ),
                ),
              ),
            ),
            ButtonWidget(
              text: 'POMIJĄĆ',
              colorText: Color(0xFF263139),
              colorButton: Color(0xFFFEFEFE),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => VisitTimeScreen(
                    branchid: widget.branchid,
                    patientid: 1,
                    date: "",
                    date2: "",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
