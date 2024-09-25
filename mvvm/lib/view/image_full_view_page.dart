import 'package:flutter/material.dart';

import '../model/image_model.dart';

class ImageFullViewPage extends StatefulWidget {
  final Hits images;
  final String tag; // Pass the hero tag

  const ImageFullViewPage({super.key, required this.images, required this.tag});

  @override
  State<ImageFullViewPage> createState() => _ImageFullViewPageState();
}

class _ImageFullViewPageState extends State<ImageFullViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fullscreen background
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context); // Return to previous screen on tap
            },
            child: Center(
              child: Hero(
                tag: widget.tag, // Use the same hero tag
                child: Image.network(
                  widget.images.largeImageURL.toString(),
                  fit: BoxFit.fitHeight,
                  width: double.infinity, // Full width
                  height: double.infinity, // Full height
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),

          // Positioned widget to show like and comment counts
          Positioned(
            bottom: 20, // Adjust based on your preference
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Like count
                Row(
                  children: [
                    const Icon(Icons.favorite, color: Colors.red), // Like icon
                    const SizedBox(width: 5),
                    Text(
                      '${widget.images.likes}', // Replace with actual like count
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),

                // Comment count
                Row(
                  children: [
                    const Icon(Icons.comment, color: Colors.white), // Comment icon
                    const SizedBox(width: 5),
                    Text(
                      '${widget.images.comments}', // Replace with actual comment count
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
