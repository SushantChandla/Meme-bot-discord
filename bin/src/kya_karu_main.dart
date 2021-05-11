import 'package:image/image.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commander/commander.dart';
import 'meme.dart';

class KyaKaruMain extends Meme {
  KyaKaruMain()
      : super('kyakarumain', 'meme kyakarumain arg1', 'assets/Kya-karu-main-mar-jau.jpeg');

  @override
  Future<void> imageEditinghandler(
      CommandContext context, Image img, List<String> args) async {
    if (args.length < 2) {
      await context.channel.sendMessage(content: '```$helpMsg```');
      return;
    }
    img = drawString(img, arial_24, 40, 30, args[0], color: 0xff000000);

    await context.channel.sendMessage(
        files: [AttachmentBuilder.bytes(encodePng(img), 'kyakarumai.png')]);
  }
}
