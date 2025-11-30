import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import 'base_form_request.dart';

class FormController<T extends BaseFormRequest>
    extends StateNotifier<AsyncValue<void>> {
  final T requestForm;
  final Future<void> Function(Map<String, dynamic> data)? onSubmit;
  Map<String, String> formErrors = {};

  FormController(this.requestForm, {this.onSubmit})
    : super(const AsyncValue.data(null));

  Map<String, String> get errors => formErrors;

  Future<void> submit(Map<String, dynamic> formData) async {
    requestForm.setData(formData); // update formData = formData;
    if (!requestForm.validate()) {
      state = const AsyncData(null); // keep state clean
      return;
    }

    try {
      state = const AsyncValue.loading();
      if (onSubmit != null) {
        log(formData.toString());
        Future.delayed(const Duration(seconds: 4));
        await onSubmit!(formData);
      }
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  void clearFieldError(String field) {
    if (formErrors.containsKey(field)) {
      formErrors.remove(field);
      state = AsyncValue.data(null);
    }
  }
}
