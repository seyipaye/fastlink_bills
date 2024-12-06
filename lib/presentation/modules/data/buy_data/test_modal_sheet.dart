import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ModalSheetDemo(),
    );
  }
}



class ModalSheetDemo extends StatelessWidget {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false, // Prevents dismissing by tapping outside
      enableDrag: false, // Prevents swiping down to dismiss
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Minimize the modal height
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Options',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.cancel, color: Colors.grey),
                    onPressed: () {
                      Navigator.pop(context); // Close the modal
                    },
                  ),
                ],
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Share'),
                onTap: () {
                  Navigator.pop(context); // Close the modal
                  // Perform action
                },
              ),
              ListTile(
                leading: Icon(Icons.copy),
                title: Text('Copy Link'),
                onTap: () {
                  Navigator.pop(context); // Close the modal
                  // Perform action
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete'),
                onTap: () {
                  Navigator.pop(context); // Close the modal
                  // Perform action
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Modal Sheet Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showBottomSheet(context),
          child: Text('Show Bottom Modal Sheet'),
        ),
      ),
    );
  }
}
