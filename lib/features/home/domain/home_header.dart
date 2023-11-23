import 'package:livestream_app/utils/assets.gen.dart';

class HomeHeader {
  final String username;
  final String profilePicture;

  const HomeHeader({
    required this.username,
    required this.profilePicture,
  });

  static List<HomeHeader> homeheader() => [
        const HomeHeader(
          username: 'Adil',
          profilePicture: AssetsImages.image1PNG,
        ),
        const HomeHeader(
          username: 'Marina',
          profilePicture: AssetsImages.image2PNG,
        ),
        const HomeHeader(
          username: 'Dean',
          profilePicture: AssetsImages.image3PNG,
        ),
        const HomeHeader(
          username: 'Max',
          profilePicture: AssetsImages.image4PNG,
        ),
        const HomeHeader(
          username: 'Abigeal',
          profilePicture: AssetsImages.image4PNG,
        ),
      ];
      
  @override
  bool operator ==(other) =>
      other is HomeHeader &&
      other.username == username &&
      other.profilePicture == profilePicture;

  @override
  int get hashCode => username.hashCode ^ profilePicture.hashCode;
}
