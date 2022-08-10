import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/view_model/base_viewmodel.dart';
import '../../locator.dart';

class Baseview<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onModelready;
  final bool dispose;

  const Baseview({
    super.key,
    required this.builder,
    required this.dispose,
    this.onModelready,
  });

  @override
  State<Baseview<T>> createState() => _BaseviewState<T>();
}

class _BaseviewState<T extends BaseViewModel> extends State<Baseview<T>> {
  final T model = locator<T>();
  @override
  void initState() {
    if (widget.onModelready != null) {
      widget.onModelready!(model);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.dispose) {
      model.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: locator<T>(),
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
