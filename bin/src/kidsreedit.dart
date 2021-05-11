import 'package:image/image.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commander/commander.dart';
import 'meme.dart';

class KidsCouldRead extends Meme {
  KidsCouldRead()
      : super('kidscouldread', 'meme kidscouldread arg1', 'assets/kidsreadit.jpeg');

  @override
  Future<void> imageEditinghandler(
      CommandContext context, Image img, List<String> args) async {
    if (args.isEmpty) {
      await context.channel.sendMessage(content: '```$helpMsg```');
      return;
    }
    img = drawString(img, arial_24, 253, 82, args[0], color: 0xff000000);

    await context.channel.sendMessage(
        files: [AttachmentBuilder.bytes(encodePng(img), 'kidscouldread.png')]);
  }
}
