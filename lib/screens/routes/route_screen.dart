enum RouteScreen {
  login('login'),
  register('register'),
  home('home'),
  profile('profile'),
  changePassword('change_password'),
  forgotPassword('forgot_password');

  final String name;
  const RouteScreen(this.name);
}