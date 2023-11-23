import 'package:livestream_app/utils/assets.gen.dart';

class GroupCallHeader {
  final String profilePicture;
  final String username;
  final String messageSubtitle;
  const GroupCallHeader({
    required this.profilePicture,
    required this.username,
    required this.messageSubtitle,
  });

  static List<GroupCallHeader> messages() => [
        const GroupCallHeader(
          profilePicture: AssetsImages.image1PNG,
          username: 'Dean Ronibad',
          messageSubtitle: 'Sounds reasonable',
        ),
        const GroupCallHeader(
          profilePicture: AssetsImages.image3PNG,
          username: 'Annel Ellison',
          messageSubtitle: 'What about our profit?',
        ),
        const GroupCallHeader(
          profilePicture: AssetsImages.image4PNG,
          username: 'John Borino',
          messageSubtitle: 'What led you to this thought?',
        ),
      ];
  @override
  bool operator ==(other) =>
      other is GroupCallHeader &&
      other.messageSubtitle == messageSubtitle &&
      other.username == username &&
      other.profilePicture == profilePicture;

  @override
  int get hashCode =>
      messageSubtitle.hashCode ^ username.hashCode ^ profilePicture.hashCode;
}
