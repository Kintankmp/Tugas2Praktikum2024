import 'package:flutter/material.dart';

class TampilData extends StatelessWidget {
  final String nama;
  final String nim;
  final int tahun;

  const TampilData({
    Key? key,
    required this.nama,
    required this.nim,
    required this.tahun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int umur = DateTime.now().year - tahun;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Perkenalan"),
        backgroundColor: const Color.fromARGB(255, 241, 107, 201),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: const Color.fromARGB(255, 241, 107, 201),
                      child: Text(
                        nama.isNotEmpty ? nama[0] : '?',
                        style: const TextStyle(
                          fontSize: 50,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Nama: $nama",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 241, 107, 201),
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "NIM: $nim",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 241, 107, 201),
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Umur: $umur tahun",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 241, 107, 201),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
