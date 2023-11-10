import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 36, 78, 112),
        title: Text('About'),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                buildCard(
                  "Profil",
                  "assets/images/foto.jpg",
                  "Nama : Dwi Lutfi Taufiq Ihsani\n"
                      "NIM    : 2315103007\n"
                      "Kelas  : S1SI-05-B\n",
                )
              ],
            )),
      ),
    );
  }
}

Card buildCard(
  String title,
  String img,
  String desc,
) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color.fromARGB(255, 36, 78, 112),
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.white,
              thickness: 1.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Center(
                  child: Image.asset(
                img,
                height: 240,
              )),
            ),
            Divider(
              color: Colors.white,
              thickness: 1.0,
            ),
            SizedBox(
              height: 8,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    desc,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
