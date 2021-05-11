import 'dart:io' show File;
import 'package:nyxx_commander/commander.dart';
import 'package:image/image.dart';

import 'help.dart';

abstract class Meme {
  String name, helpMsg, assetFile;
  Future<void> imageEditinghandler(
      CommandContext context, Image img, List<String> args);
  Meme(this.name, this.helpMsg, this.assetFile);
}

class MemeCommand {
  Commander commander;
  MemeCommand(this.commander);

  void registerCommand(Meme data) {
    commander.registerCommand(
        data.name, (context, message) => handler(context, message, data));
    HelpCommand.instance.addCommand(data);
  }

  void handler(CommandContext context, String message, Meme data) async {
    var image = decodeImage(File(data.assetFile).readAsBytesSync())!;
    final args = message.toLowerCase().split(data.name.toLowerCase());
    args.removeAt(0);
    final msg = args.join(data.name).trim().split('|');
    await data.imageEditinghandler(context, image, msg);
  }
}
