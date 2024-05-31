import 'package:flutter/material.dart';

class AddClienteButton extends StatelessWidget {
  const AddClienteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blue[100],
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.primary,
          ],
        ),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            radius: 30,
            child: const Icon(
              Icons.person_add_alt,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        title: const Text(
          'Agregar Cliente',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
