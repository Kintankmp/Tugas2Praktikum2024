import '/ui/tampil_data.dart';
import 'package:flutter/material.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  FormDataState createState() => FormDataState();
}

class FormDataState extends State<FormData> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Data"),
        backgroundColor: const Color.fromARGB(255, 241, 107, 201),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _textboxNama(),
                    const SizedBox(height: 16),
                    _textboxNIM(),
                    const SizedBox(height: 16),
                    _textboxTahun(),
                    const SizedBox(height: 20),
                    _tombolSimpan(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textboxNama() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama"),
      controller: _namaController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Nama tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _textboxNIM() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "NIM"),
      controller: _nimController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'NIM tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _textboxTahun() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Tahun Lahir"),
      controller: _tahunController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Tahun lahir tidak boleh kosong';
        }
        final intValue = int.tryParse(value);
        if (intValue == null) {
          return 'Masukkan tahun yang valid';
        }
        return null;
      },
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          String nama = _namaController.text;
          String nim = _nimController.text;
          int tahun = int.parse(_tahunController.text);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  TampilData(nama: nama, nim: nim, tahun: tahun)));
        }
      },
      child: const Text('Simpan'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink, // Use backgroundColor instead of primary
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(fontSize: 16),
      ),
    );
  }
}
