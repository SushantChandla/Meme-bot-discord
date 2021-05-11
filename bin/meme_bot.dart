import 'dart:io' show Platform;
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commander/commander.dart';
import 'src/QuizKid.dart';
import 'src/bro_not_cool.dart';
import 'src/drake.dart';
import 'src/help.dart';
import 'src/kidsreedit.dart';
import 'src/kya_karu_main.dart';
import 'src/meme.dart';
import 'src/woah_worthless.dart';
import 'src/woman_cat.dart';

void main() {
  final env = Platform.environment;
  var token = env['TOKEN'];
  if (token == null) {
    print('KEY NOT FOUND');
    return;
  }
  final bot = Nyxx(token, GatewayIntents.allUnprivileged);
  final commander = Commander(bot, prefix: 'meme');
  final memeCommander = MemeCommand(commander);

  memeCommander.registerCommand(BroNotCool());
  memeCommander.registerCommand(Drake());
  memeCommander.registerCommand(Quizkid());
  memeCommander.registerCommand(Worthless());
  memeCommander.registerCommand(WomanCat());
  memeCommander.registerCommand(KidsCouldRead());
  memeCommander.registerCommand(KyaKaruMain());


  HelpCommand.instance.addHelpGroup(commander);
}
