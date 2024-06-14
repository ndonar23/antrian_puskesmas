import 'package:antrian_puskesmas/pages/booking.dart';
import 'package:antrian_puskesmas/services/shared_pref.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? name, image;
  getthedatafromsharedpref() async {
    name = await SharedpreferenceHelper().getUserName();
    image = await SharedpreferenceHelper().getUserImage();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hallo,",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      name!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      image!,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ))
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              color: Colors.white30,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Pelayanan",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Booking(
                                    service: 'Poli Umum',
                                  )));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 150,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(216, 117, 185, 22),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/poliumum.png",
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Poli Umum",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Booking(
                                    service: 'Poli Anak',
                                  )));
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(216, 117, 185, 22),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/polianak.png",
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Poli Anak",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Booking(
                                    service: 'Poli Gigi',
                                  )));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 150,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(216, 117, 185, 22),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/poligigi.png",
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Poli Gigi",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Booking(
                                    service: 'Poli Jantung',
                                  )));
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(216, 117, 185, 22),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/polijantung.png",
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Poli Jantung",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Booking(
                                    service: 'Poli Ortopedi',
                                  )));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 150,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(216, 117, 185, 22),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/poliortopedi.png",
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Poli Ortopedi",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Booking(
                                    service: 'Poli Gigi',
                                  )));
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(216, 117, 185, 22),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/polisyaraf.png",
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Poli Syaraf",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
