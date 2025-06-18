import 'package:ditonton/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('RouteObserver should be initialized', () {
    expect(routeObserver, isA<RouteObserver<ModalRoute<dynamic>>>());
  });
}