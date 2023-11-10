import 'package:flutter/material.dart';

class BiodataPage extends StatefulWidget {
  final Biodata biodata;

  BiodataPage({required this.biodata});

  @override
  _BiodataPageState createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _hobiController = TextEditingController();
  late String _selectedJenisKelamin;

  @override
  void initState() {
    super.initState();
    _namaController.text = widget.biodata.nama;
    _alamatController.text = widget.biodata.alamat;
    _hobiController.text = widget.biodata.hobi;
    _selectedJenisKelamin = widget.biodata.jenisKelamin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Biodata'),
        backgroundColor: const Color.fromARGB(255, 36, 78, 112),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            SizedBox(height: 16),
            Text('Jenis Kelamin'),
            Row(
              children: [
                Radio(
                  value: 'Laki-laki',
                  groupValue: _selectedJenisKelamin,
                  onChanged: (value) {
                    setState(() {
                      _selectedJenisKelamin = value.toString();
                    });
                  },
                ),
                Text('Laki-laki'),
                Radio(
                  value: 'Perempuan',
                  groupValue: _selectedJenisKelamin,
                  onChanged: (value) {
                    setState(() {
                      _selectedJenisKelamin = value.toString();
                    });
                  },
                ),
                Text('Perempuan'),
              ],
            ),
            TextField(
              controller: _alamatController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            TextField(
              controller: _hobiController,
              decoration: InputDecoration(labelText: 'Hobi'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Biodata updatedBiodata = Biodata(
                  nama: _namaController.text,
                  jenisKelamin: _selectedJenisKelamin,
                  alamat: _alamatController.text,
                  hobi: _hobiController.text,
                );
                Navigator.pop(context, updatedBiodata);
              },
              child: Text('Simpan Biodata'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 36, 78, 112),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Biodata {
  String nama;
  String jenisKelamin;
  String alamat;
  String hobi;

  Biodata({
    required this.nama,
    required this.jenisKelamin,
    required this.alamat,
    required this.hobi,
  });
}
