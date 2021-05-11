import 'package:image/image.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commander/commander.dart';
import 'meme.dart';

class WomanCat extends Meme {
  WomanCat()
      : super('womancat', 'meme womancat arg1 | arg2', 'assets/woman-cat.jpeg');

  @override
  Future<void> imageEditinghandler(
      CommandContext context, Image img, List<String> args) async {
    if (args.length < 2) {
      await context.channel.sendMessage(content: '```$helpMsg```');
      return;
    }
    img = drawString(img, arial_24, 34, 252, args[0], color: 0xff000000);
    img = drawString(img, arial_24, 423, 203, args[1], color: 0xff000000);

    await context.channel.sendMessage(
        files: [AttachmentBuilder.bytes(encodePng(img), 'womancat.png')]);
  }
}
