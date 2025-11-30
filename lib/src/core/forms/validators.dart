import 'base_form_request.dart';

class Validators {
  static Validator required(String fieldName) {
    return (value, _) =>
        (value == null || value.toString().trim().isEmpty)
            ? '$fieldName is required'
            : null;
  }

  static Validator email(String fieldName) {
    return (value, _) {
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
      return !emailRegex.hasMatch(value ?? '')
          ? '$fieldName must be a valid email'
          : null;
    };
  }

  static Validator minLength(String fieldName, int length) {
    return (value, _) =>
        (value?.length ?? 0) < length
            ? '$fieldName must be at least $length characters'
            : null;
  }

  static Validator confirmed(String fieldName, String otherField) {
    return (value, data) =>
        value != data[otherField] ? '$fieldName does not match' : null;
  }

  static Validator combine(List<Validator> validators) {
    return (value, data) {
      for (final validator in validators) {
        final error = validator(value, data);
        if (error != null) return error;
      }
      return null;
    };
  }
}
