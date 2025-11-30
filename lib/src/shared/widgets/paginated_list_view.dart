import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../core/pagination/paginator.dart';
import '../shared.dart';

typedef ItemBuilder<T> = Widget Function(BuildContext, T);

class PaginatedListView<T> extends ConsumerWidget {
  const PaginatedListView({
    required this.provider,
    required this.itemBuilder,
    super.key,
  });

  final StateNotifierProvider<Paginator<T>, AsyncValue<List<T>>> provider;
  final ItemBuilder<T> itemBuilder;

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(provider);
    final paginated = ref.watch(provider.notifier);
    return state.when(
      data:
          (items) => NotificationListener<ScrollNotification>(
            onNotification: (scroll) {
              if (scroll.metrics.pixels >=
                  scroll.metrics.maxScrollExtent - 200) {
                paginated.loadMore();
              }
              return false;
            },
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, i) => itemBuilder(context, items[i]),
            ),
          ),
      loading: () => Center(child: SpinKitChasingDots(color: context.primary)),
      error: (e, st) => AppAlerts.error(message: e.toString()),
    );
  }
}
