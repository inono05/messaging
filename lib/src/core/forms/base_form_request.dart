typedef Validator =
    String? Function(dynamic value, Map<String, dynamic> allData);

abstract class BaseFormRequest {
  Map<String, dynamic> _data;
  final Map<String, String> errors = {};

  BaseFormRequest(this._data);

  void setData(Map<String, dynamic> formData) {
    _data = formData;
  }

  Map<String, Validator> rules();

  Map<String, String> messages();

  bool validate() {
    errors.clear();
    final validationRules = rules();
    final customMessages = messages();

    for (final field in validationRules.keys) {
      final validator = validationRules[field]!;
      final value = _data[field];
      final error = validator(value, _data);
      if (error != null) {
        errors[field] = customMessages[field] ?? error;
      }
    }
    return errors.isEmpty;
  }

  bool get isValid => errors.isEmpty;
}
