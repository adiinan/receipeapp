
import 'package:flutter/material.dart';
import 'package:foodreciepe/modal/recipe.dart';
import 'package:hive/hive.dart';


ValueNotifier<List<Recipe>> notifeir = ValueNotifier([]);

Future<void> addData(Recipe value) async {
  final data = await Hive.openBox<Recipe>('db');
  data.add(value);

  getData();
}

Future<void> getData() async {
  final data = await Hive.openBox<Recipe>('db');
  notifeir.value.clear();
  notifeir.value.addAll(data.values);
  notifeir.notifyListeners();
}

Future<void> delete(int index) async {
  final data = await Hive.openBox<Recipe>('db');
  data.deleteAt(index);
  getData();
}

Future<void> update(int index, Recipe value) async {
  final data = await Hive.openBox<Recipe>('db');

  data.putAt(index, value);
  getData(); 

}