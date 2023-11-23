import 'package:livestream_app/utils/assets.gen.dart';

class ChatHeader {
  final String profilePicture;
  final String username;
  final String messageSubtitle;
  const ChatHeader({
    required this.profilePicture,
    required this.username,
    required this.messageSubtitle,
  });

  static List<ChatHeader> messages() => [
        const ChatHeader(
          profilePicture: AssetsImages.image6PNG,
          username: 'Alex Linderson',
          messageSubtitle: 'How are you today',
        ),
        const ChatHeader(
          profilePicture: AssetsImages.image4PNG,
          username: 'Team Align',
          messageSubtitle: 'Don\'t miss to attend the meeting',
        ),
        const ChatHeader(
          profilePicture: AssetsImages.image3PNG,
          username: 'John Abraham',
          messageSubtitle: 'Hay!Can you join the meeting?',
        ),
        const ChatHeader(
          profilePicture: AssetsImages.image2PNG,
          username: 'Sabila Sayma',
          messageSubtitle: 'How are you today',
        ),
        const ChatHeader(
          profilePicture: AssetsImages.image1PNG,
          username: 'John Borino',
          messageSubtitle: 'Have a good day💮',
        )
      ];
  @override
  bool operator ==(other) =>
      other is ChatHeader &&
      other.messageSubtitle == messageSubtitle &&
      other.username == username &&
      other.profilePicture == profilePicture;

  @override
  int get hashCode =>
      messageSubtitle.hashCode ^ username.hashCode ^ profilePicture.hashCode;
}
