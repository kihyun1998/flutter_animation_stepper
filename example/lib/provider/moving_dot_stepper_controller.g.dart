// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moving_dot_stepper_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movingDotStepperControllerHash() =>
    r'6fe033fe91cca579aace5c56200d2d6e088fb30f';

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

abstract class _$MovingDotStepperController
    extends BuildlessAutoDisposeNotifier<MovingDotStepperState> {
  late final String exampleId;
  late final int stepCount;

  MovingDotStepperState build(String exampleId, int stepCount);
}

/// See also [MovingDotStepperController].
@ProviderFor(MovingDotStepperController)
const movingDotStepperControllerProvider = MovingDotStepperControllerFamily();

/// See also [MovingDotStepperController].
class MovingDotStepperControllerFamily extends Family<MovingDotStepperState> {
  /// See also [MovingDotStepperController].
  const MovingDotStepperControllerFamily();

  /// See also [MovingDotStepperController].
  MovingDotStepperControllerProvider call(String exampleId, int stepCount) {
    return MovingDotStepperControllerProvider(exampleId, stepCount);
  }

  @override
  MovingDotStepperControllerProvider getProviderOverride(
    covariant MovingDotStepperControllerProvider provider,
  ) {
    return call(provider.exampleId, provider.stepCount);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'movingDotStepperControllerProvider';
}

/// See also [MovingDotStepperController].
class MovingDotStepperControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<
          MovingDotStepperController,
          MovingDotStepperState
        > {
  /// See also [MovingDotStepperController].
  MovingDotStepperControllerProvider(String exampleId, int stepCount)
    : this._internal(
        () => MovingDotStepperController()
          ..exampleId = exampleId
          ..stepCount = stepCount,
        from: movingDotStepperControllerProvider,
        name: r'movingDotStepperControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$movingDotStepperControllerHash,
        dependencies: MovingDotStepperControllerFamily._dependencies,
        allTransitiveDependencies:
            MovingDotStepperControllerFamily._allTransitiveDependencies,
        exampleId: exampleId,
        stepCount: stepCount,
      );

  MovingDotStepperControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.exampleId,
    required this.stepCount,
  }) : super.internal();

  final String exampleId;
  final int stepCount;

  @override
  MovingDotStepperState runNotifierBuild(
    covariant MovingDotStepperController notifier,
  ) {
    return notifier.build(exampleId, stepCount);
  }

  @override
  Override overrideWith(MovingDotStepperController Function() create) {
    return ProviderOverride(
      origin: this,
      override: MovingDotStepperControllerProvider._internal(
        () => create()
          ..exampleId = exampleId
          ..stepCount = stepCount,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        exampleId: exampleId,
        stepCount: stepCount,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    MovingDotStepperController,
    MovingDotStepperState
  >
  createElement() {
    return _MovingDotStepperControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovingDotStepperControllerProvider &&
        other.exampleId == exampleId &&
        other.stepCount == stepCount;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, exampleId.hashCode);
    hash = _SystemHash.combine(hash, stepCount.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MovingDotStepperControllerRef
    on AutoDisposeNotifierProviderRef<MovingDotStepperState> {
  /// The parameter `exampleId` of this provider.
  String get exampleId;

  /// The parameter `stepCount` of this provider.
  int get stepCount;
}

class _MovingDotStepperControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          MovingDotStepperController,
          MovingDotStepperState
        >
    with MovingDotStepperControllerRef {
  _MovingDotStepperControllerProviderElement(super.provider);

  @override
  String get exampleId =>
      (origin as MovingDotStepperControllerProvider).exampleId;
  @override
  int get stepCount => (origin as MovingDotStepperControllerProvider).stepCount;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
