import 'package:flutter/material.dart';

import '../widgets/provider_auth_view_body.dart';

class ProviderAuthView extends StatelessWidget {
  const ProviderAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: ProviderAuthViewBody(size: size),
    );
  }
}
