enum RouteScreen {
  login('login'),
  register('register'),
  main('main'),
  profile('profile'),
  changePassword('change_password');

  final String name;
  const RouteScreen(this.name);
}