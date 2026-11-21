import 'package:material_ui/material_ui.dart';
import 'package:provai/domain/models/paywall_placement.dart';

// TODO(provai): Tasarım B'ye göre uygulanacak; şimdilik router iskeleti için yer tutucu.
class PaywallScreen extends StatelessWidget {
  const PaywallScreen({required this.placement, super.key});

  final PaywallPlacement placement;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('PaywallScreen')));
  }
}
