import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/domain/entities/season.dart';

class SeasonCard extends StatelessWidget {
  final Season season;

  const SeasonCard({super.key, required this.season});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          if (season.posterPath != null)
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(12),
              ),
              child: FutureBuilder(
                future: getNetworkImage(
                  path: season.posterPath ?? '',
                  width: 100,
                  height: 150,
                ),
                builder: (context, asyncSnapshot) {
                  return ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child:
                        asyncSnapshot.data ??
                        SizedBox(
                          width: 100,
                          height: 150,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                  );
                },
              ),
            )
          else
            Container(
              width: 100,
              height: 150,
              color: Colors.grey[300],
              child: const Icon(Icons.image_not_supported),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    season.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Air Date: ${season.airDate ?? "Unknown"}'),
                  Text('Episodes: ${season.episodeCount}'),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        season.voteAverage == 0.0
                            ? '-'
                            : '${season.voteAverage}/10',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
