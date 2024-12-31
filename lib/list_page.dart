import 'package:flutter/material.dart';
import 'package:flutter_provider/add_data_page.dart';
import 'package:flutter_provider/list_map_provider.dart';
import 'package:flutter_provider/main.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List"),
      ),
      body: Consumer<ListMapProvider>(builder: (ctx, provider, __) {
        var allData = provider.getData();
        return allData.isNotEmpty
            ? ListView.builder(
                itemCount: allData.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text('${allData[index]['name']}'),
                    subtitle: Text('${allData[index]['mo no']}'),
                    trailing: SizedBox(
                      width: 120,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                context.read<ListMapProvider>().updateData({
                                  "name": "Updated Mayur",
                                  "mo no": "451268496+94",
                                }, index);
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                context
                                    .read<ListMapProvider>()
                                    .deletedData(index);
                              },
                              icon: const Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  );
                })
            : const Center(
                child: Text("no data found!!"),
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddDataPage(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
