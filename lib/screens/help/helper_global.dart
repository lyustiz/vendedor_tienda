import 'package:flutter/material.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:vendedor_tienda/widgets/layout/app_title_bar_variant.dart';

class HelperGlobal extends StatefulWidget {
  const HelperGlobal({super.key});

  @override
  State<HelperGlobal> createState() => _HelperGlobalState();
}

class _HelperGlobalState extends State<HelperGlobal> {
  /*  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  ); */

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    /*  final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    }); */
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      color: 'purple',
      titleBar: AppTitleBarVariant(
        color: 'white',
        title: 'Ayuda de la Aplicacion',
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.chevron_left,
                color: Theme.of(context).colorScheme.primary)),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primary,
                ],
              ),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /*  _infoTile('App name', _packageInfo.appName),
                _infoTile('Package name', _packageInfo.packageName),
                _infoTile('App version', _packageInfo.version),
                _infoTile('Build number', _packageInfo.buildNumber),
                _infoTile('Build signature', _packageInfo.buildSignature), */
              ],
            ),
          )
        ],
      ),
    );
  }
}
