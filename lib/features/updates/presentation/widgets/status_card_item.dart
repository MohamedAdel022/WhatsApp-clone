import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/utils/assets.dart';

class StatusCardItem extends StatelessWidget {
  const StatusCardItem({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 11 / 16,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        // Background image painted into the Material's ink layer
        child: Ink.image(
          image: AssetImage(Assets.statusTest),
          fit: BoxFit.cover,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10),
            splashColor: Colors.grey.withValues(alpha: .2),
            highlightColor: Colors.grey.withValues(alpha: .1),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green, width: 2),
                    ),

                    child: ClipOval(
                      child: Ink.image(
                        image: AssetImage(Assets.temp),
                        fit: BoxFit.cover,
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ),

                  const Spacer(),

                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      "Mohamed Adel",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(color: Colors.black54, blurRadius: 4)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
