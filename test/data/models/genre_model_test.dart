import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tGenreModel = GenreModel(id: 1, name: 'Action');
  final tGenre = Genre(id: 1, name: 'Action');

  test('should be a subclass of Genre entity', () async {
    final result = tGenreModel.toEntity();
    expect(result, tGenre);
  });

  test('should create GenreModel from JSON', () async {
    // arrange
    final Map<String, dynamic> jsonMap = {
      'id': 1,
      'name': 'Action'
    };
    
    // act
    final result = GenreModel.fromJson(jsonMap);
    
    // assert
    expect(result, tGenreModel);
  });

  test('should convert to JSON map', () async {
    // arrange
    final expectedJsonMap = {
      'id': 1,
      'name': 'Action'
    };
    
    // act
    final result = tGenreModel.toJson();
    
    // assert
    expect(result, expectedJsonMap);
  });
}