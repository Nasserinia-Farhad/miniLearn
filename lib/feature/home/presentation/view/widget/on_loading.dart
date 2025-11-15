import 'package:flutter/cupertino.dart';

class OnLoading extends StatelessWidget {
  const OnLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: CupertinoActivityIndicator());
  }
}
