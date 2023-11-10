import 'package:flutter/material.dart';
import 'package:praktikum_modul_7_login_unguided/aboutPage.dart';
import 'package:praktikum_modul_7_login_unguided/biodataPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Biodata _biodata = Biodata(nama: '', jenisKelamin: '', alamat: '', hobi: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: const Color.fromARGB(255, 36, 78, 112),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () =>
                _openPageAbout(context: context, fullscreenDialog: true),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Biodata',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Image.asset(
                  "assets/images/biodata.png",
                  width: 160.0,
                  height: 120.0,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 43, 72, 95),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 106, 105, 105),
                      blurRadius: 24,
                      offset: Offset(0, 11),
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      8.0,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 12.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(
                              'Nama: ${_biodata.nama}',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Jenis Kelamin: ${_biodata.jenisKelamin}',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Alamat: ${_biodata.alamat}',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Hobi: ${_biodata.hobi}',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ])),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Biodata? updatedBiodata = await Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: false,
              builder: (context) => BiodataPage(biodata: _biodata),
            ),
          );

          if (updatedBiodata != null && updatedBiodata is Biodata) {
            setState(() {
              _biodata = updatedBiodata;
            });
          }
        },
        backgroundColor: Color.fromARGB(255, 36, 78, 112),
        tooltip: 'Ubah Biodata',
        child: Image.asset('assets/images/biodata.png'),
      ),
    );
  }

  void _openPageAbout({
    required BuildContext context,
    required bool fullscreenDialog,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => AboutPage(),
      ),
    );
  }

  void _openPageBiodata({
    required BuildContext context,
    required bool fullscreenDialog,
  }) async {
    final Biodata? updatedBiodata = await Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => BiodataPage(biodata: _biodata),
      ),
    );

    if (updatedBiodata != null) {
      setState(() {
        _biodata = updatedBiodata;
      });
    }
  }
}
