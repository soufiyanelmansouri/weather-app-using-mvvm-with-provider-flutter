import 'package:flutter_test/flutter_test.dart';
import 'package:wetherapp/core/view_model/base_viewmodel.dart';

void main() {
  late BaseViewModel sut;
  setUp(() {
    sut = BaseViewModel();
  });
  group('Testing different states', () {
    test('Test initial values', () {
      expect(sut.state, false);
      expect(sut.secondState, false);
    });
  });

  test('set state methods', () {
    sut.setState(true);
    sut.setsecondState(true);
    expect(sut.state, true);
    expect(sut.secondState, true);
  });
}
