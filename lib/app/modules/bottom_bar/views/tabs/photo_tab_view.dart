import 'package:flutter/material.dart';

class PhotoTabView extends StatelessWidget {
  const PhotoTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
              "https://firebasestorage.googleapis.com/v0/b/fair-catcher-353106.appspot.com/o/photos.png?alt=media&token=c21f5578-0270-4cbf-92e5-4794c0142c70"),
        );
      },
    );
  }
}
