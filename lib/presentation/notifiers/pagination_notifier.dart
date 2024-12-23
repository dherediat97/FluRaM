import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class PaginationFilter<F> {
  late F currentFilter;

  Future<void> applyFilter(F filter);
}

abstract class PaginationController<T, I> {
  I get initialPage;

  late I currentPage = initialPage;

  FutureOr<List<T>> loadPage(I page);

  Future<void> loadNextPage();

  I nextPage(I currentPage);
}

mixin AsyncPaginationController<T, I> on AsyncNotifier<List<T>>
    implements PaginationController<T, I> {
  @override
  late I currentPage = initialPage;

  @override
  FutureOr<List<T>> build() async => loadPage(initialPage);

  @override
  Future<void> loadNextPage() async {
    state = AsyncLoading<List<T>>();

    final newState = await AsyncValue.guard<List<T>>(() async {
      currentPage = nextPage(currentPage);
      final elements = await loadPage(currentPage);
      return [...?state.valueOrNull, ...elements];
    });
    state = newState;
  }
}

mixin AsyncPaginationFilter<F, T, I> on AsyncPaginationController<T, I>
    implements PaginationFilter<F> {
  @override
  Future<void> applyFilter(F filter) async {
    currentPage = initialPage;
    currentFilter = filter;

    state = AsyncLoading<List<T>>();

    final newState = await AsyncValue.guard<List<T>>(() async {
      return await loadPage(currentPage);
    });
    state = newState;
  }
}
