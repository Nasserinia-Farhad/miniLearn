import 'package:flutter/cupertino.dart';

class OnLoadingView extends StatelessWidget {
  const OnLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }
}
