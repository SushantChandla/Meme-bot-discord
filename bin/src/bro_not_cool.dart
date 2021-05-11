import 'package:image/image.dart';
import 'package:image/src/image.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commander/commander.dart';
import 'meme.dart';

class BroNotCool extends Meme {
  BroNotCool()
      : super('bronotcool', 'meme bronotcool arg1 | arg2 | arg3',
            'assets/Bro-Not-Cool.jpeg');

  @override
  Future<void> imageEditinghandler(
      CommandContext context, Image img, List<String> args) async {
    print(args);
    if (args.length < 3) {
      await context.sendMessage(content: '```$helpMsg```');
      return;
    }
    img = drawString(img, arial_24, 160, 380, args[0], color: 0xffffffff);
    img = drawString(img, arial_24, 524, 208, args[1], color: 0xffffffff);
    img = drawString(img, arial_24, 180, 723, args[2], color: 0xffffffff);
    img = drawString(img, arial_24, 424, 817, args[1], color: 0xffffffff);
    final res = encodePng(img);
    await context
        .sendMessage(files: [AttachmentBuilder.bytes(res, 'bronotcool.png')]);
  }
}
