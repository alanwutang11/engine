// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

@TestOn('chrome || safari || firefox')

import 'dart:async';

import 'package:test/bootstrap/browser.dart';
import 'package:test/test.dart';
import 'package:ui/src/engine/browser_detection.dart';
import 'package:ui/src/engine/renderer.dart';
import 'package:ui/src/engine/skwasm/skwasm_stub/renderer.dart';

void main() {
  internalBootstrapBrowserTest(() => testMain);
}

Future<void> testMain() async {
  group('Skwasm stub tests', () {
    test('Skwasm stub renderer throws', () {
      expect(renderer, isA<SkwasmRenderer>());
      expect(() {
        renderer.initialize();
      }, throwsUnimplementedError);
    }, skip: isWasm);
    // This test is specifically designed for the JS case, to make sure we
    // compile to the skwasm stub renderer.
  });
}
