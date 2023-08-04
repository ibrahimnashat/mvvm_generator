library mvvm_generator;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/generators/cache_cubit_generator.dart';
import 'src/generators/cache_usecase_generator.dart';
import 'src/generators/cubit_generator.dart';
import 'src/generators/local_data_source_generator.dart';
import 'src/generators/optimize/optimize_generator.dart';
import 'src/generators/repository_generator.dart';
import 'src/generators/requests_generator.dart';
import 'src/generators/test/cache_usecase_test_generator.dart';
import 'src/generators/test/cubit_test_generator.dart';
import 'src/generators/test/get_cache_usecase_test_generator.dart';
import 'src/generators/test/repository_test_generator.dart';
import 'src/generators/test/usecase_test_generator.dart';
import 'src/generators/usecase_generator.dart';

export 'src/annotations.dart';

Builder generateArchitecture(BuilderOptions options) => SharedPartBuilder(
      [
        OptimizeGenerator(),
        RequestsGenerator(),
        LocalDataSourceGenerator(),
        RepositoryGenerator(),
        UseCaseGenerator(),
        CacheUseCaseGenerator(),
        CubitGenerator(),
        CacheCubitGenerator(),

        ///[Test]
        RepositoryTestGenerator(),
        UseCaseTestGenerator(),
        CacheUseCaseTestGenerator(),
        GetCacheUseCaseTestGenerator(),
        CubitTestGenerator(),
      ],
      'clean_architecture',
      formatOutput: (code) {
        return '#BUILD DONE SUCCESSFULLY';
      },
    );
