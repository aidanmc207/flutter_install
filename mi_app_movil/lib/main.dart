import 'package:flutter/material.dart';

void main() {
  runApp(const MiAppMovilEmpresarial());
}

class MiAppMovilEmpresarial extends StatelessWidget {
  const MiAppMovilEmpresarial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IF0009 Mobile Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D47A1),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const PantallaPrincipalMovil(titulo: 'Panel Móvil IF0009'),
    );
  }
}

class PantallaPrincipalMovil extends StatefulWidget {
  final String titulo;

  const PantallaPrincipalMovil({super.key, required this.titulo});

  @override
  State<PantallaPrincipalMovil> createState() => _PantallaPrincipalMovilState();
}

class _PantallaPrincipalMovilState extends State<PantallaPrincipalMovil> {
  int _contador = 0;

  void _incrementar() {
    setState(() {
      _contador++;
    });
  }

  void _decrementar() {
    setState(() {
      if (_contador > 0) {
        _contador--;
      }
    });
  }

  void _reiniciar() {
    setState(() {
      _contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    // SafeArea protege la interfaz contra el notch, Dynamic Island
    // y gestos del sistema tanto en Android como en iOS
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
        backgroundColor: tema.colorScheme.primaryContainer,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Reiniciar contador',
            onPressed: _reiniciar,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.mobile_friendly,
                        size: 48.0,
                        color: tema.colorScheme.primary,
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Registros móviles sincronizados:',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        '$_contador',
                        style: tema.textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: tema.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn_decrementar',
            onPressed: _decrementar,
            tooltip: 'Decrementar',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 14.0),
          FloatingActionButton(
            heroTag: 'btn_incrementar',
            onPressed: _incrementar,
            tooltip: 'Incrementar',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
