import 'dart:core';

import 'package:surf_dart_courses_template/aricultural_machinery.dart';
import 'package:surf_dart_courses_template/surf_dart_courses_template.dart';

void main() {
  /// Вычислите средний возраст всей техники на всех угодьях, учитывая обе структуры (mapBefore2010 и mapAfter2010).
  List<int> allDateTimes = [];
  final DateTime now = DateTime.now();

  mapBefore2010.forEach((country, territories) {
    territories.forEach((territory) {
      territory.machineries.forEach((machine) {
        allDateTimes.add(machine.releaseDate.year);
      });
    });
  });

  mapAfter2010.forEach((country, territories) {
    territories.forEach((territory) {
      territory.machineries.forEach((machine) {
        allDateTimes.add(machine.releaseDate.year);
      });
    });
  });

  int totalAge = 0;
  for (var data in allDateTimes) {
    int age = (now.year - data);
    totalAge += age;
  }

  print(
      "Средний возраст всей техники:  ${(totalAge / allDateTimes.length).round()}");

  /// Отсортируйте всю технику по возрасту, затем взяв 50% самой старой техники, определите её средний возраст.

  final Set<AgriculturalMachinery> machinesSet = Set();

  mapBefore2010.forEach((country, territories) {
    territories.forEach((territory) {
      for (var machine in territory.machineries) {
        machinesSet.add(machine);
      }
    });
  });

  mapAfter2010.forEach((country, territories) {
    territories.forEach((territory) {
      for (var machine in territory.machineries) {
        machinesSet.add(machine);
      }
    });
  });

  final List<AgriculturalMachinery> machineriesList2 = machinesSet.toList();

  machineriesList2.sort((a, b) => a.releaseDate.compareTo(b.releaseDate));

  final List<AgriculturalMachinery> listMiddle =
      machineriesList2.sublist(0, (machineriesList2.length / 2).round());

  totalAge = 0;
  for (var machinery in listMiddle) {
    int age = now.year - machinery.releaseDate.year;
    totalAge += age;
  }
  print(
      'Средний возраст самой старой техники - ${(totalAge / listMiddle.length)} лет');
}
