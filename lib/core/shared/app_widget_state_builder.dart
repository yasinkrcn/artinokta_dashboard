import 'package:flutter/material.dart';
import 'package:tv_artinokta/core/utils/ui_state.dart';

class AppWidgetBuilderByState<T> extends StatelessWidget {
  const AppWidgetBuilderByState({
    super.key,
    required this.response,
    required this.builder,
    this.idleWidget,
    this.loadingWidget,
    this.errorWidget,
  });

  final UIState<T> response;
  final Widget Function(T) builder;
  final Widget? idleWidget;
  final Widget? loadingWidget;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    switch (response.status) {
      case UIStateStatus.idle:
        return idleWidget ?? const SizedBox.shrink();
      case UIStateStatus.loading:
        return Center(child: loadingWidget ?? const CircularProgressIndicator.adaptive());
      case UIStateStatus.success:
        return builder(response.data);
      case UIStateStatus.error:
        return Center(
          child: errorWidget ??
              Text(
                (response.failure.message) ?? "",
                textAlign: TextAlign.center,
              ),
        );
    }
  }
}
