import 'package:material_ui/material_ui.dart';

// TODO(provai): Tasarım B'ye göre uygulanacak; şimdilik router iskeleti için yer tutucu.
class ResultScreen extends StatelessWidget {
  const ResultScreen({required this.sessionId, super.key});

  final String sessionId;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('ResultScreen')));
  }
}
