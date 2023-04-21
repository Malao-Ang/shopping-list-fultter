import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shopping_list/data/categories.dart';

class newItemScreen extends StatefulWidget {
  const newItemScreen({super.key});

  @override
  State<newItemScreen> createState() => _newItemScreenState();
}

class _newItemScreenState extends State<newItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              maxLength: 50,
              decoration: InputDecoration(label: Text("Name")),
              validator: (value) {
                return 'Demo...';
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(label: Text('Quantity')),
                    initialValue: '1',
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField(items: [
                    for (final category in categories.entries)
                      DropdownMenuItem(
                          value: category.key,
                          child: Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                color: category.value.color,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(category.value.title)
                            ],
                          ))
                  ], onChanged: (value) {}),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: Text("Reset")),
                ElevatedButton(onPressed: () {}, child: Text("AddItem"))
              ],
            )
          ],
        )),
      ),
    );
  }
}
