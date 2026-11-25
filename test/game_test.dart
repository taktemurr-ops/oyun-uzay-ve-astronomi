import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_uzay_ve_astronomi/oyun_uzay_ve_astronomi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(uzayVeAstronomiConfig.title.length, 33);
    expect(uzayVeAstronomiConfig.tagline.length, 33);
    for (final s in uzayVeAstronomiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(uzayVeAstronomiConfig.gameId, uzayVeAstronomiId);
    expect(uzayVeAstronomiRules.gameId, uzayVeAstronomiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(uzayVeAstronomiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: uzayVeAstronomiId, optionalMechanics: uzayVeAstronomiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(uzayVeAstronomiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
