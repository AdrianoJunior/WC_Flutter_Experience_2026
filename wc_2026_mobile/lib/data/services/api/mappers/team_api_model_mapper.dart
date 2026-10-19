import 'package:wc_2026_mobile/data/services/api/models/team/team_api_model.dart';
import 'package:wc_2026_mobile/domain/models/team/team.dart';

extension TeamApiModelMapper on TeamApiModel {
  Team toDomain() {
    return Team(
      code: code,
      name: name,
      flagUrl: flagUrl,
      primaryColor: int.parse(primaryColor.replaceFirst('#', 'FF'), radix: 16),
    );
  }
}
