import 'dart:async';
import 'dart:io';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:package_config/package_config.dart';
import 'package:source_gen/source_gen.dart';

Future<LibraryReader> resolveCompilationUnit(String sourceFile) async {
  final packageConfig = await loadPackageConfigUri(
    File('.dart_tool/package_config.json').absolute.uri,
  );

  final assetId = AssetId('kiwi_generator', sourceFile);
  final library = await resolveAsset(
    assetId,
    (resolver) => resolver.libraryFor(assetId),
    packageConfig: packageConfig,
  );

  return LibraryReader(library);
}
