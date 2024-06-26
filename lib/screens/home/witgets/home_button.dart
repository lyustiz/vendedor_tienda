import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? body;
  final VoidCallback? onTap;
  final Color color;
  const HomeButton(
      {super.key,
      required this.icon,
      required this.title,
      this.body,
      this.onTap,
      this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            width: double.infinity,
            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                    ),
                    child: Text(
                      title.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: double.infinity,
                    padding:
                        const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 12),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20)),
                    ),
                    child: body,
                  )
                ],
              ),
              Positioned(
                right: 0,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.secondary,
                          Theme.of(context).colorScheme.secondaryContainer
                        ],
                      )),
                  child: Icon(
                    icon,
                    size: 75,
                    color: Colors.white,
                  ),
                ),
              )
            ])));
  }
}
