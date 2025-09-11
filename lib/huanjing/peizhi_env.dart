
enum JCPzHuanjingEnv {
  dev(mingzi: "dev"),
  prod(mingzi: "prod");

  const JCPzHuanjingEnv({required this.mingzi});
  final String mingzi;
}
