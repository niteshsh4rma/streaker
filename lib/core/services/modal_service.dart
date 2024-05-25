import 'package:flutter/material.dart';

class ModalService {
  static Future<T?> showModal<T>(
    BuildContext context,
    Widget Function(BuildContext) builder,
  ) {
    return showModalBottomSheet<T>(
      context: context,
      builder: builder,
      useRootNavigator: true,
      useSafeArea: true,
      showDragHandle: true,
    );
  }
}
