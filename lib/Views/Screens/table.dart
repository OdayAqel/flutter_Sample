import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowTable extends StatefulWidget {
  const ShowTable({Key? key}) : super(key: key);

  @override
  State<ShowTable> createState() => ShowNewTableState();
}

class ShowNewTableState extends State<ShowTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Table'),
        backgroundColor: const Color(0xFF000080),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('your_collection_name')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            // Extract the documents from the snapshot
            final documents = snapshot.data!.docs;

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Column 1')),
                  DataColumn(label: Text('Column 2')),
                  // Add more DataColumn widgets for additional columns
                ],
                rows: documents.map((doc) {
                  final data = doc.data() as Map<String, dynamic>;
                  final column1Value = data['column_1'];
                  final column2Value = data['column_2'];
                  // Extract the values for each column from the document data

                  return DataRow(
                    cells: [
                      DataCell(Text(column1Value)),
                      DataCell(Text(column2Value)),
                      // Add more DataCell widgets for additional columns
                    ],
                  );
                }).toList(),
              ),
            );
          }

          return const Text('No data available.');
        },
      ),
    );
  }
}
