//      URI             AUTH
// auth/sign-up          -
// auth/sign-in          -
// recipes              -+
// recipes/details/{id} -+
// recipes/favorites     +
// user/profile          +
// user/sign-out         +
/*
enum UriGroup { auth, receipts, user }

enum UriAuthGroup { signUp, signIn }

enum UriReceiptsGroup { list, details, favorites }

enum UriUserGroup { profile, signOut }

class AppRoutingState2 {
  final UriGroup uriGroup;
  final UriAuthGroup? uriAuthGroup;
  final UriReceiptsGroup? uriReceiptsGroup;
  final UriUserGroup? uriUserGroup;
  final int? uriGroupItemId;
  final int? userId;

  AppRoutingState._({
    required this.uriGroup,
    this.uriAuthGroup,
    this.uriReceiptsGroup,
    this.uriUserGroup,
    this.uriGroupItemId,
    this.userId,
  });

  factory AppRoutingState.authSignUpPage() {
    return AppRoutingState._(
      uriGroup: UriGroup.auth,
      uriAuthGroup: UriAuthGroup.signUp,
    );
  }

  bool isAuthSignUpPage() {
    return uriAuthGroup == UriAuthGroup.signUp;
  }

  factory AppRoutingState.authSignInPage() {
    return AppRoutingState._(
      uriGroup: UriGroup.auth,
      uriAuthGroup: UriAuthGroup.signIn,
    );
  }

  bool isAuthSignInPage() {
    return uriAuthGroup == UriAuthGroup.signIn;
  }

  factory AppRoutingState.receiptsPage(int? userId) {
    return AppRoutingState._(
      uriGroup: UriGroup.receipts,
      uriReceiptsGroup: UriReceiptsGroup.list,
      userId: userId,
    );
  }

  bool isReceiptsPage() {
    return uriReceiptsGroup == UriReceiptsGroup.list;
  }

  factory AppRoutingState.receiptsDetailsPage(int groupItemId, int? userId) {
    return AppRoutingState._(
      uriGroup: UriGroup.receipts,
      uriReceiptsGroup: UriReceiptsGroup.details,
      uriGroupItemId: groupItemId,
      userId: userId,
    );
  }

  bool isReceiptsDetailsPage() {
    return uriReceiptsGroup == UriReceiptsGroup.details;
  }

  factory AppRoutingState.receiptsFavoritesPage(int userId) {
    return AppRoutingState._(
      uriGroup: UriGroup.receipts,
      uriReceiptsGroup: UriReceiptsGroup.favorites,
      userId: userId,
    );
  }

  bool isReceiptsFavoritesPage() {
    return uriReceiptsGroup == UriReceiptsGroup.favorites;
  }

  factory AppRoutingState.userProfilePage(int userId) {
    return AppRoutingState._(
      uriGroup: UriGroup.user,
      uriUserGroup: UriUserGroup.profile,
      userId: userId,
    );
  }

  bool isUserProfilePage() {
    return uriUserGroup == UriUserGroup.profile;
  }

  factory AppRoutingState.userSignOutPage(int userId) {
    return AppRoutingState._(
      uriGroup: UriGroup.user,
      uriUserGroup: UriUserGroup.signOut,
      userId: userId,
    );
  }

  bool isUserSignOutPage() {
    return uriUserGroup == UriUserGroup.signOut;
  }
}
*/
