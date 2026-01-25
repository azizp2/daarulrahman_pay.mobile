import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('❌ Feature name required');
    print('👉 Example: dart run tool/feature_generator.dart auth');
    exit(1);
  }

  final featureName = args.first;
  final basePath = 'lib/features/$featureName';

  final folders = [
    '$basePath/data/models',
    '$basePath/data/repo',
    '$basePath/data/sources',
    '$basePath/domain/entities',
    '$basePath/domain/repo',
    '$basePath/domain/usecases',
    '$basePath/presentation/controllers',
    '$basePath/presentation/pages',
    '$basePath/presentation/state',
  ];

  for (final folder in folders) {
    Directory(folder).createSync(recursive: true);
    print('📁 created: $folder');
  }

  print('\n✅ Feature "$featureName" folder structure generated');
}
