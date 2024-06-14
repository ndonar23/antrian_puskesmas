import 'package:antrian_puskesmas/services/database.dart';
import 'package:antrian_puskesmas/services/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class Booking extends StatefulWidget {
  String service;
  Booking({required this.service});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  String? name, image, email;
  getthedatafromsharedpref() async {
    name = await SharedpreferenceHelper().getUserName();
    image = await SharedpreferenceHelper().getUserImage();
    email = await SharedpreferenceHelper().getUserEmail();
    setState(() {});
  }

  getontheload() async {
    await getthedatafromsharedpref();
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context, firstDate: DateTime(2024), lastDate: DateTime(2025));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _selectedTime);
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Daftarkan Antreanmu Sekarang\nAntrian Cepat Anda Selamat",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "images/antree.jpg",
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 20.0,
            ),
            Text(
              widget.service,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                  color: Color.fromARGB(121, 112, 175, 25),
                  borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    "set a date",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                  color: Color.fromARGB(121, 112, 175, 25),
                  borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    "set a time",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _selectTime(context);
                        },
                        child: Icon(
                          Icons.alarm,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        _selectedTime.format(context),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            GestureDetector(
                onTap: () async {
                  String Id = randomAlphaNumeric(10);
                  Map<String, dynamic> userInfoMap = {
                    "Service": widget.service,
                    "Date":
                        "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}"
                            .toString(),
                    "Time": _selectedTime.format(context).toString(),
                    "Username": name,
                    "Image": image,
                    "Email": email,
                    "Id": Id,
                  };
                  await DatabaseMethods()
                      .addUserBooking(userInfoMap, Id)
                      .then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      "Daftar Antrean Berhasil!",
                      style: TextStyle(fontSize: 20.0),
                    )));
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(216, 117, 185, 22),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "DAFTARKAN ANTREAN",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
