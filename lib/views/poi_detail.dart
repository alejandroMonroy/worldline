import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:worldline/models/poi.dart';

class PoiDetail extends StatelessWidget {
  final Poi poi;

  const PoiDetail({
    super.key,
    required this.poi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poi Detail'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: poi.imageUrl,
            fit: BoxFit.cover,
            height: 160.0,
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              poi.title,
              textAlign: TextAlign.center,
              style: Get.theme.textTheme.headlineLarge,
            ),
          ),
          const SizedBox(height: 16.0),
          TextButton(
            onPressed: () async {
              try {
                final url = Uri.parse(
                    'maps:${poi.geoCoord.lat},${poi.geoCoord.lng}?q=${poi.geoCoord.lat},${poi.geoCoord.lng}');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              } catch (error) {}
            },
            child: const Text('Cómo legar'),
          ),
        ],
      ),
    );
  }
}
