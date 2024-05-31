import 'package:flutter/material.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:vendedor_tienda/widgets/layout/app_title_bar_variant.dart';

class CondicionesScreen extends StatelessWidget {
  const CondicionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      color: 'white',
      titleBar: AppTitleBarVariant(
        title: 'Terminos y Condiciones',
        leading: IconButton(
            onPressed: () => navigateTo(context, 'login'),
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            )),
      ),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                color: Colors.blue,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    '''Tal como se utiliza en estos términos y condiciones, "nosotros" o "Bingo JL" significa Bingo JL y "tú" significa la persona o entidad que utiliza los productos personalizados de Bingo JL. Cualquier persona o entidad que desee utilizar los productos personalizados de Bingo JL debe aceptar estos términos y condiciones sin cambio alguno. AL INGRESAR A LA APP, ACEPTAS ESTAR COMPROMETIDO CON LOS TÉRMINOS Y CONDICIONES, EL AVISO DE PRIVACIDAD DE BINGO JL, LAS CONDICIONES DE USO Y TODAS SUS PAUTAS.
            
Personalización. Los productos personalizados que utilices serán proveidos por terceros con quienes Bingo JL esté asociado para usar dichos productos.
            
Concesión de Licencia para los Productos. Por este instrumento usted le otorga a Bingo JL y sus filiales el derecho y la licencia permanente, sin regalías, no exclusiva y en todo el mundo en relación con la producción de los productos personalizados que utilice para (a) reproducir, distribuir y mostrar los materiales que presente, nombres comerciales y nombres y semejanzas de las personas que aparezcan en sus materiales, (b) modificar y crear trabajos derivados de estos materiales y (c) sublicenciar los derechos anteriores a terceros que proporcionan los productos personalizados y servicios relacionados.
            
Pautas y Restricciones. Aceptas presentarnos los materiales de conformidad con todas las pautas de uso publicadas en el sitio web de Bingo JL o de las cuales se te notifiquen (“Pautas"). En particular, aceptas no presentar materiales que sean ilegales, pornográficos, difamatorios, ilícitos, obscenos, discriminatorios, o que de otro modo violen las normas generales de la comunidad de Amazon. Nos reservamos expresamente el derecho a retirar o no hacer disponible cualesquiera Materiales que consideremos se encuentren en violación de este Acuerdo, las leyes aplicables o nuestras normas de comunidad conforme a nuestro absoluto criterio.
            
Declaraciones, Garantías e Indemnizaciones. Declaras y garantizas a Bingo JL, sus filiales y sublicenciatarios que (a) tiene el derecho de conceder las licencias establecidas de estos términos y condiciones, incluyendo todos los derechos necesarios para la reproducción, distribución y otro uso de los materiales por parte de Bingo JL, sus filiales y sublicenciatarios, tal como se permite en el presente documento, y (b) los materiales que usted envíe y el ejercicio de los derechos de Bingo JL, sus filiales y sublicenciatarios conforme a este instrumento, no violarán, malversarán ni infringirán ningún derecho de propiedad intelectual, incluyendo, de manera enunciativa mas no limitativa los derechos de marcas, derechos de autor, derechos morales o derechos de publicidad de terceros. Te comprometes a indemnizar, defender y liberar de responsabilidad a Bingo JL, sus filiales y sublicenciatarios (incluyendo terceros que proporcionen productos personalizados y servicios relacionados) respecto a cualquier reclamación, responsabilidad, daños y gastos (incluyendo, de manera enunciativa mas no limitativa honorarios y gastos razonables de abogados) que deriven del incumplimiento de estos términos y condiciones.''',
                    textAlign: TextAlign.justify,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
