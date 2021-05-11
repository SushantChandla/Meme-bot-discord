import 'package:nyxx_commander/commander.dart';

import 'meme.dart';

class HelpCommand {
  static final instance = HelpCommand();
  String helpmsg = '''``` 
                MEME BOT
  **You can also use meme help {command name}**
        use | to between arguments.
  ''';
  CommandGroup group = CommandGroup(name: 'help');
  void addHelpGroup(Commander c) {
    c.registerCommandGroup(group);
  }

  HelpCommand() {
    group.registerDefaultCommand(defaultHandler);
  }

  void addCommand(Meme c) {
    group.registerSubCommand(
        c.name, (context, message) => subCommandHandler(context, c.helpMsg));
    helpmsg += '\n  ${c.name} : \n    ${c.helpMsg}';
  }

  void subCommandHandler(CommandContext context, String help) async {
    await context.sendMessage(content: '```$help```');
  }

  void defaultHandler(CommandContext context, String message) async {
    await context.sendMessage(content: helpmsg + '```');
  }
}
