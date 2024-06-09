import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../../../data/models/note_model.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('ALL NOTES'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getAllNotes(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Obx(
            () => (controller.allNote.length == 0)
                ? Center(
                    child: Text("Tidak ada Catatan"),
                  )
                : ListView.builder(
                    itemCount: controller.allNote.length,
                    itemBuilder: (context, index) {
                      Note note = controller.allNote[index];
                      return ListTile(
                        onTap: () => Get.toNamed(
                          Routes.EDIT_NOTE,
                          arguments: note,
                        ),
                        leading: CircleAvatar(
                          child: Text("${note.id}"),
                        ),
                        title: Text("${note.title}"),
                        subtitle: Text("${note.desc}"),
                        trailing: IconButton(
                          onPressed: () =>
                              _showDeleteConfirmationDialog(context, note.id!),
                          icon: Icon(Icons.delete),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_NOTE),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int noteId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Hapus Catatan"),
          content: Text("Apakah Anda yakin ingin menghapus catatan ini?"),
          actions: [
            TextButton(
              child: Text("Batal"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Hapus"),
              onPressed: () {
                controller.deleteNote(noteId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
