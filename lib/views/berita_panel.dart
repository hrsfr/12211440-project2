import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pendataanwarga/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';

class BeritaPanel extends StatelessWidget {
  const BeritaPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _TitleBeritaPanel(),
        elevation: 0,
        actions: [_TombolActionBeritaPanel()],
      ),
      body: Text('Berita'),
    );
  }
}

class _TombolActionBeritaPanel extends StatelessWidget {
  const _TombolActionBeritaPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BeritaPanelProvider>(builder: (context, prov, w) {
      return IconButton(
          onPressed: () {
            prov.ubahmode();
          },
          icon: Visibility(
            visible: prov.modecari == true,
            child: Icon(FontAwesomeIcons.circleXmark),
            replacement: Icon(FontAwesomeIcons.magnifyingGlass),
          ));
    });
  }
}

class _TitleBeritaPanel extends StatelessWidget {
  const _TitleBeritaPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BeritaPanelProvider>(builder: (context, prov, w) {
      return Visibility(
        visible: prov.modecari,
        child: CupertinoSearchTextField(
          backgroundColor: Color.fromARGB(255, 196, 106, 4),
          style: TextStyle(color: Colors.white),
          placeholderStyle:
              TextStyle(color: Color.fromARGB(255, 155, 155, 155)),
        ),
        replacement: Text('Berita Terkini'),
      );
    });
  }
}
