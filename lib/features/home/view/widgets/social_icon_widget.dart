import 'package:flutter/material.dart';

class SocialIconWidget extends StatefulWidget {
  const SocialIconWidget({
    super.key,
    this.name,
    this.isNetworkImage = false,
    this.url,
    this.onTap,
  });
  final String? name;
  final String? url;
  final bool isNetworkImage;
  final VoidCallback? onTap;

  @override
  State<SocialIconWidget> createState() => _SocialIconWidgetState();
}

class _SocialIconWidgetState extends State<SocialIconWidget> {
  double iconSize = 28;
  double scale = 1;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (v) {
        if (v) {
          scale = 1.2;
        } else {
          scale = 1;
        }
        setState(() {});
      },
      hoverColor: Colors.transparent,
      child: Transform.scale(
        scale: scale,
        child: AnimatedContainer(
          height: iconSize + 2,
          width: iconSize + 2,
          padding: const EdgeInsets.all(2),
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: widget.isNetworkImage
              ? Center(
                  child: Image.network(
                    widget.url!,
                    height: iconSize,
                    width: iconSize,
                    fit: BoxFit.cover,
                  ),
                )
              : Image.asset(
                  'assets/${widget.name}.png',
                  height: iconSize,
                  width: iconSize,
                ),
        ),
      ),
    );
    ;
  }
}
