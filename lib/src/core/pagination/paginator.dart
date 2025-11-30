import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

abstract interface class IPaginator<T> {
  Future<List<T>> call({int? page, int? limit});
}

class Paginator<T> extends StateNotifier<AsyncValue<List<T>>> {
  Paginator({required this.getItems}) : super(const AsyncValue.loading()) {
    loadMore();
  }

  final Future<List<T>> Function({int? page, int? limit}) getItems;
  int limit = 10;
  int? _page;
  bool _isLoading = false;
  bool _hasMore = true;

  Future<void> loadMore() async {
    if (_isLoading || !_hasMore) return;
    _isLoading = true;
    try {
      final previous = state.value ?? <T>[];
      final newItems = await getItems(page: _page, limit: limit);
      if (newItems.length < limit) _hasMore = false;
      state = AsyncValue.data([...previous, ...newItems]);
      if (_page != null) {
        _page = _page! + 1;
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    } finally {
      _isLoading = false;
    }
  }

  void reset() {
    state = const AsyncValue.loading();
    _page = null;
    _hasMore = true;
    limit = 10;
    loadMore();
  }
}
