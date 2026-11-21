import 'package:flutter_test/flutter_test.dart';
import 'package:provai/utils/string_x.dart';

void main() {
  test('Türkçede noktalı i büyük İ olur, noktasız ı büyük I olur', () {
    expect('iş ilanı'.toUpperCaseFor('tr'), 'İŞ İLANI');
  });

  test('İngilizcede standart dönüşüm yapılır', () {
    expect('job posting'.toUpperCaseFor('en'), 'JOB POSTING');
  });
}
