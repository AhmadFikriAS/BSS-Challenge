import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ParkingPage extends StatefulWidget {
  const ParkingPage({super.key});

  @override
  State<ParkingPage> createState() => _ParkingPageState();
}

class _ParkingPageState extends State<ParkingPage> {
  final List<Map> data = List.generate(15,
      (index) => {'id': index, 'name': 'Parking $index', 'isSelected': false});
  void showAlertDialog() {
    {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: 'Berhasil memilih parkir!',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parking Page'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext ctx, index) {
            return Card(
                key: ValueKey(data[index]['name']),
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: data[index]['isSelected'] == true
                    ? Colors.amber
                    : Colors.white,
                child: ListTile(
                  onTap: () {
                    setState(() {
                      showAlertDialog();
                      data[index]['isSelected'] = !data[index]['isSelected'];
                    });
                  },
                  leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(data[index]['id'].toString())),
                  title: Text(data[index]['name']),
                ));
          },
        ),
      ),
    );
  }
}
