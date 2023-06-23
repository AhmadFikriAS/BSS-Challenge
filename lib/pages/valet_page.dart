import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class ValetPage extends StatefulWidget {
  const ValetPage({super.key});

  @override
  State<ValetPage> createState() => _ValetPageState();
}

class _ValetPageState extends State<ValetPage> {
  final List<Map> data = List.generate(15,
      (index) => {'id': index, 'name': 'Valet $index', 'isSelected': false});
  void showAlertDialog() {
    {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: 'Berhasil memilih valet!',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Valet Page'),
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
                      backgroundColor: Colors.red,
                      child: Text(data[index]['id'].toString())),
                  title: Text(data[index]['name']),
                ));
          },
        ),
      ),
    );
  }
}
