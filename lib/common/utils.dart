import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/io_client.dart';

import 'constants.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

Future<SecurityContext> get globalContext async {
  final sslCert = await rootBundle.load('certificate/image-tmdb-org.pem');
  SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
  securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());
  return securityContext;
}

Future<Widget> getNetworkImage({
  required String path,
  double width = 80,
  double height = 120,
}) async {
  Widget fallback = Container(
    width: width,
    height: height,
    color: Colors.grey[300],
    child: Icon(Icons.image_not_supported, size: width / 3),
  );
  try {
    HttpClient client = HttpClient(context: await globalContext);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => false;
    IOClient ioClient = IOClient(client);
    final response = await ioClient.get(Uri.parse('$BASE_IMAGE_URL$path'));

    if (response.statusCode == 200) {
      return CachedNetworkImage(
        imageUrl: '$BASE_IMAGE_URL$path',
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        placeholder: (context, url) {
          return const Center(child: CircularProgressIndicator());
        },
      );
    }
  } catch (e) {
    return fallback;
  }
  return fallback;
}
