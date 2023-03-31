import 'package:flutter/widgets.dart';
import 'package:textly/src/common/initialization/model/repository_storage.dart';

@immutable
class RepositoryScope extends StatelessWidget {
  const RepositoryScope({
    required this.repositoryStorage,
    required this.builder,
    super.key,
  });

  final RepositoryStorage repositoryStorage;
  final WidgetBuilder builder;

  /// Получить результат инициализации из контекста
  /// Работает только в контексте проинициализированного приложения
  static RepositoryStorage of(BuildContext context) {
    final inhW = context
        .getElementForInheritedWidgetOfExactType<_InheritedRepositoryScope>()
        ?.widget;
    final store =
        inhW is _InheritedRepositoryScope ? inhW.repositoryStorage : null;
    return store ?? _throwNotInitializedYet();
  }

  static Never _throwNotInitializedYet() =>
      throw UnsupportedError('The application has not been initialized yet');

  @override
  Widget build(BuildContext context) => _InheritedRepositoryScope(
        repositoryStorage: repositoryStorage,
        child: Builder(
          builder: builder,
        ),
      );
}

@immutable
class _InheritedRepositoryScope extends InheritedWidget {
  const _InheritedRepositoryScope({
    required this.repositoryStorage,
    required super.child,
  });

  final RepositoryStorage repositoryStorage;

  @override
  bool updateShouldNotify(_InheritedRepositoryScope oldWidget) => false;
}

extension RepositoryScopeX on BuildContext {
  RepositoryStorage get repoStorage => RepositoryScope.of(this);
}
