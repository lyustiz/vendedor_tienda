import 'package:flutter/material.dart';
import 'package:vendedor_tienda/entities/cliente.dart';

class ClienteButton extends StatelessWidget {
  const ClienteButton({super.key, required this.cliente, required this.replace});

  final Cliente? cliente;
  final bool replace;

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
          dense: true,
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              radius: 24,
              child: const Icon(
                Icons.person_outlined,
                color: Colors.white,
                size: 34,
              ),
            ),
          ),
          title: Text(
            cliente!.nombre,
            style: const TextStyle(fontSize: 18),
          ),
          subtitle: Text(cliente!.celular, style: const TextStyle(fontSize: 16)),
          trailing: Icon(
            (replace) ? Icons.repeat : Icons.check,
            size: 30,
          )),
    );
  }
}
