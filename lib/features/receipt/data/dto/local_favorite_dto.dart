import 'package:hive/hive.dart';

part 'local_favorite_dto.g.dart';

@HiveType(typeId: 9)
class LocalFavoriteDto {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int receiptId;
  @HiveField(2)
  final int userId;

  LocalFavoriteDto({
    required this.id,
    required this.receiptId,
    required this.userId,
  });
}
