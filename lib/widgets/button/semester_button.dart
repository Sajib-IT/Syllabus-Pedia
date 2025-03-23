import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SemesterButton extends StatelessWidget {
  final String text;
  final bool isCenter;
  final FontWeight? fontWeight;
  final VoidCallback? onTab;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const SemesterButton({
    super.key,
    required this.text,
    this.onTab,
    this.onEdit,
    this.onDelete,
    this.fontWeight,
    this.isCenter = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: InkWell(
        onTap: onTab,
        child: Stack(children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: onEdit != null ? 16.0 : 16,
                vertical: onEdit != null ? 16.0 : 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent.shade100),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: isCenter
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    text,
                    textAlign: isCenter ? TextAlign.center : TextAlign.start,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: fontWeight ?? FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (onEdit != null)
            Positioned(
              bottom: 10,
              right: 0,
              child:  IconButton(
                visualDensity: VisualDensity.compact,
                icon: Icon(Icons.more_vert,size: 28, color: Colors.black),
                onPressed: (){
                  showEditDeletePopup( onEdit!, onDelete!);
                },
              ),
              // child: Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     IconButton(
              //       visualDensity: VisualDensity.compact,
              //       icon: Icon(Icons.edit, color: Colors.blue),
              //       onPressed: onEdit,
              //     ),
              //     IconButton(
              //       visualDensity: VisualDensity.compact,
              //       icon: Icon(Icons.delete, color: Colors.red),
              //       onPressed: onDelete,
              //     ),
              //   ],
              // ),
            )
        ]),
      ),
    );
  }
}


void showEditDeletePopup(Function() onEdit, Function() onDelete) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.edit, color: Colors.blue),
            title: Text("Edit"),
            onTap: () {
              Get.back();
              showEditPopup( onEdit);// Close the popup
              // onEdit(); // Call the edit function
            },
          ),
          ListTile(
            leading: Icon(Icons.delete, color: Colors.red),
            title: Text("Delete"),
            onTap: () {
              Get.back(); // Close the popup
              onDelete(); // Call the delete function
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    ),
  );
}

void showEditPopup( Function() onEdit) {
  TextEditingController textController = TextEditingController();

  Get.dialog(
    AlertDialog(
      title: Text("Edit Item"),
      content: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: "Enter new value",
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(), // Close popup
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            // if (textController.text.isNotEmpty) {
            //   onEdit(); // Pass new value
            //   Get.back(); // Close popup
            // }
          },
          child: Text("Save"),
        ),
      ],
    ),
  );
}
