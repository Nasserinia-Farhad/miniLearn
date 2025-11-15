import 'package:dartz/dartz.dart';

/// Abstract class about all of use-cases
/// The [Type] value is a return value
/// The [Params] value is a input value
abstract class UseCase<Type, Params> {
  Future<Either<Exception, Type>> call({required Params params});
}

class NoParams {}
