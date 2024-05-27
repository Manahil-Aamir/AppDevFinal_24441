// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todosStreamHash() => r'e77d2b7c4e204597af822068e41c70fbda342dad';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [todosStream].
@ProviderFor(todosStream)
const todosStreamProvider = TodosStreamFamily();

/// See also [todosStream].
class TodosStreamFamily extends Family<AsyncValue<List<ToDo>>> {
  /// See also [todosStream].
  const TodosStreamFamily();

  /// See also [todosStream].
  TodosStreamProvider call(
    String category,
  ) {
    return TodosStreamProvider(
      category,
    );
  }

  @override
  TodosStreamProvider getProviderOverride(
    covariant TodosStreamProvider provider,
  ) {
    return call(
      provider.category,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'todosStreamProvider';
}

/// See also [todosStream].
class TodosStreamProvider extends AutoDisposeStreamProvider<List<ToDo>> {
  /// See also [todosStream].
  TodosStreamProvider(
    String category,
  ) : this._internal(
          (ref) => todosStream(
            ref as TodosStreamRef,
            category,
          ),
          from: todosStreamProvider,
          name: r'todosStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$todosStreamHash,
          dependencies: TodosStreamFamily._dependencies,
          allTransitiveDependencies:
              TodosStreamFamily._allTransitiveDependencies,
          category: category,
        );

  TodosStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String category;

  @override
  Override overrideWith(
    Stream<List<ToDo>> Function(TodosStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TodosStreamProvider._internal(
        (ref) => create(ref as TodosStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<ToDo>> createElement() {
    return _TodosStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TodosStreamProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TodosStreamRef on AutoDisposeStreamProviderRef<List<ToDo>> {
  /// The parameter `category` of this provider.
  String get category;
}

class _TodosStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<ToDo>> with TodosStreamRef {
  _TodosStreamProviderElement(super.provider);

  @override
  String get category => (origin as TodosStreamProvider).category;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
