import 'package:surf_dart_courses_template/surf_dart_courses_template.dart';

import 'aricultural_machinery.dart';

enum Countries { brazil, russia, turkish, spain, japan }

class Territory {
  final int areaInHectare;
  final List<String> crops;
  final List<AgriculturalMachinery> machineries;

  Territory(
    this.areaInHectare,
    this.crops,
    this.machineries,
  );
}
