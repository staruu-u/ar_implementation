import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF142464),
        title: const Text('My Favorites'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: 8,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (context, index) {
          if (index < 2) {
            // Display different images for the first row
            return _buildImageContainer(context, index + 1);
          } else {
            // Display locked images for the remaining rows
            return _buildLockedContainer();
          }
        },
      ),
    );
  }

  Widget _buildImageContainer(BuildContext context, int index) {
    bool isLocked = index > 1;
    if (isLocked) {
      return _buildLockedContainer();
    } else {
      return GestureDetector(
        onTap: () {
          // Navigate to the ImageDescriptionPage with specific image details
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ImageDescriptionPage(
                imageUrl: 'images/diversityintechnology.png',
                title: 'Diversity in Technology',
                artistName: 'Rafael Blanco',
                description:
                    "Rafael Blanco is a renowned mural artist known for his vibrant and captivating artwork. His murals often feature bold colors, intricate details, and a strong sense of storytelling. With a keen eye for composition and a deep understanding of his subjects, Blanco's murals are visually striking and emotionally evocative. Blanco's style incorporates elements of realism and surrealism, blending them seamlessly to create a unique and thought-provoking aesthetic. He often uses symbolism and metaphor to convey powerful messages and explore themes of identity, culture, social issues, and the human experience. Through his murals, Blanco aims to engage and inspire viewers, sparking conversations and creating a sense of connection within the community. His artwork can be found in various public spaces, enriching the urban landscape and bringing art to a wider audience. With his talent and passion for mural art, Rafael Blanco continues to make a significant impact in the art world, leaving a lasting impression on both local communities and art enthusiasts alike.",
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          child: Image.asset(
            'images/diversityintechnology.png',
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }

  Widget _buildLockedContainer() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF142464),
      ),
      child: const Center(
        child: Icon(
          Icons.lock,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ImageDescriptionPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String artistName;
  final String description;

  const ImageDescriptionPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.artistName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(imageUrl),
            const SizedBox(height: 16.0),
            Text('Artist: $artistName'),
            const SizedBox(height: 16.0),
            Text('Description: $description'),
          ],
        ),
      ),
    );
  }
}
