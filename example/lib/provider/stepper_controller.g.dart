// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stepper_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$stepperControllerHash() => r'2c120d7c5b9494626f087b5a0a76bbebc993b5e9';

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

abstract class _$StepperController
    extends BuildlessAutoDisposeNotifier<StepperState> {
  late final String exampleId;
  late final List<StepItem> steps;

  StepperState build(String exampleId, List<StepItem> steps);
}

/// See also [StepperController].
@ProviderFor(StepperController)
const stepperControllerProvider = StepperControllerFamily();

/// See also [StepperController].
class StepperControllerFamily extends Family<StepperState> {
  /// See also [StepperController].
  const StepperControllerFamily();

  /// See also [StepperController].
  StepperControllerProvider call(String exampleId, List<StepItem> steps) {
    return StepperControllerProvider(exampleId, steps);
  }

  @override
  StepperControllerProvider getProviderOverride(
    covariant StepperControllerProvider provider,
  ) {
    return call(provider.exampleId, provider.steps);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'stepperControllerProvider';
}

/// See also [StepperController].
class StepperControllerProvider
    extends AutoDisposeNotifierProviderImpl<StepperController, StepperState> {
  /// See also [StepperController].
  StepperControllerProvider(String exampleId, List<StepItem> steps)
    : this._internal(
        () => StepperController()
          ..exampleId = exampleId
          ..steps = steps,
        from: stepperControllerProvider,
        name: r'stepperControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$stepperControllerHash,
        dependencies: StepperControllerFamily._dependencies,
        allTransitiveDependencies:
            StepperControllerFamily._allTransitiveDependencies,
        exampleId: exampleId,
        steps: steps,
      );

  StepperControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.exampleId,
    required this.steps,
  }) : super.internal();

  final String exampleId;
  final List<StepItem> steps;

  @override
  StepperState runNotifierBuild(covariant StepperController notifier) {
    return notifier.build(exampleId, steps);
  }

  @override
  Override overrideWith(StepperController Function() create) {
    return ProviderOverride(
      origin: this,
      override: StepperControllerProvider._internal(
        () => create()
          ..exampleId = exampleId
          ..steps = steps,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        exampleId: exampleId,
        steps: steps,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<StepperController, StepperState>
  createElement() {
    return _StepperControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StepperControllerProvider &&
        other.exampleId == exampleId &&
        other.steps == steps;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, exampleId.hashCode);
    hash = _SystemHash.combine(hash, steps.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StepperControllerRef on AutoDisposeNotifierProviderRef<StepperState> {
  /// The parameter `exampleId` of this provider.
  String get exampleId;

  /// The parameter `steps` of this provider.
  List<StepItem> get steps;
}

class _StepperControllerProviderElement
    extends AutoDisposeNotifierProviderElement<StepperController, StepperState>
    with StepperControllerRef {
  _StepperControllerProviderElement(super.provider);

  @override
  String get exampleId => (origin as StepperControllerProvider).exampleId;
  @override
  List<StepItem> get steps => (origin as StepperControllerProvider).steps;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
