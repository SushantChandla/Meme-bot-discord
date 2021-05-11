import 'package:image/image.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commander/commander.dart';
import 'meme.dart';

class Worthless extends Meme {
  Worthless() : super('worthless', 'meme worthless arg', 'assets/woah-worthless.jpeg');

  @override
  Future<void> imageEditinghandler(
      CommandContext context, Image img, List<String> args) async {
    if (args.isEmpty) {
      await context.channel.sendMessage(content: '```$helpMsg```');
      return;
    }
    img = drawString(img, arial_24, 110, 115, args[0], color: 0xff000000);

    await context.channel.sendMessage(
        files: [AttachmentBuilder.bytes(encodePng(img), 'worthless.png')]);
  }
}
