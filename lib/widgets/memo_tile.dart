import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'dart:math';
import '../models/memo.dart';

class MemoTile extends StatelessWidget {
  final Memo memo;
  final Function onTap;
  final Function onFavoriteTapped;

  const MemoTile({
    super.key,
    required this.memo,
    required this.onTap,
    required this.onFavoriteTapped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                memo.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: memo.isFavorite ? Colors.pink : null,
              ),
              onPressed: () => onFavoriteTapped(),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        stops: [0.9, 1.0],
                        tileMode: TileMode.clamp,
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.dstIn,
                    child: Text(
                      memo.title,
                      overflow: TextOverflow.visible,
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        stops: [0.9, 1.0],
                        tileMode: TileMode.clamp,
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.dstIn,
                    child: Text(
                      memo.content.length > 50
                          ? '${memo.content.substring(0, min(100, memo.content.length))}...'
                          : memo.content,
                      overflow: TextOverflow.visible,
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              timeago.format(memo.updatedAt),
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
