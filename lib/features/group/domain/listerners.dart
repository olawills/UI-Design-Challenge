import 'package:livestream_app/utils/assets.gen.dart';

class Listeners {
  final String profilePicture;

  const Listeners({
    required this.profilePicture,
  });

  static List<Listeners> recorders() => [
        const Listeners(
          profilePicture: AssetsImages.image7PNG,
        ),
        const Listeners(
          profilePicture: AssetsImages.image8PNG,
        ),
        const Listeners(
          profilePicture: AssetsImages.image9PNG,
        ),
        const Listeners(
          profilePicture: AssetsImages.image10PNG,
        ),
        const Listeners(
          profilePicture: AssetsImages.image1PNG,
        ),
      ];
  @override
  bool operator ==(other) =>
      other is Listeners && other.profilePicture == profilePicture;

  @override
  int get hashCode => profilePicture.hashCode;
}
