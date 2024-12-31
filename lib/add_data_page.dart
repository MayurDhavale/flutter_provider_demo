import 'package:flutter/material.dart';
import 'package:flutter_provider/list_map_provider.dart';
import 'package:provider/provider.dart';

class AddDataPage extends StatelessWidget {
  const AddDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Center(
        child: IconButton(
          onPressed: (){
              context.read<ListMapProvider>().addData({
            "name": "Mayur",
            "mo no": "4512639874",
        });
          }, 
        icon: const Icon(Icons.add)
        ),
      ),
    );
  }
}
