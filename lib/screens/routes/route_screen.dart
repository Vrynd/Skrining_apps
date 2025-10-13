enum RouteScreen {
  login('login'),
  register('register'),
  home('home'),
  profile('profile'),
  changePassword('change_password'),
  forgotPassword('forgot_password'),
  question('question');

  final String name;
  const RouteScreen(this.name);
}