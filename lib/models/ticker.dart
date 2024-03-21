class Ticker {
  //cria um stream de int
  Stream<int> tick({
    required int ticks,
  }) {
    //gera uma sequencia de eventos em um intervalo fixo
    return Stream.periodic(
      const Duration(
        seconds: 1,
      ),
      (x) => ticks - x - 1,
    ).take(ticks);
  }
}
