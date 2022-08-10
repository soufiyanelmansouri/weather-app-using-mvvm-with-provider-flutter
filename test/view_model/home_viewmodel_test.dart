import 'package:flutter_test/flutter_test.dart';
import 'package:wetherapp/core/view_model/home_viewmodel.dart';

void main() {
  late HomeViewModel sut;
  setUp(() {
    sut = HomeViewModel();
  });
  group('Testing different states', () {
    test('Test initial values', () {
      expect(sut.currentIndex, 0);
    });
  });

  test('set index methods', () {
    sut.setIndex(1);
    expect(sut.currentIndex, 1);
  });
}
