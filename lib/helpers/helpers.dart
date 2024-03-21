abstract class Helpers {
  static String convertSecondsForString(int appSeconds) {
    int hours = appSeconds ~/ 3600; // Divide por 3600 para obter as horas
    int minutes = (appSeconds ~/ 60) %
        60; // Divide por 60 e pega o resto para obter os minutos
    int seconds = appSeconds %
        60; // Pega o resto da divisão por 60 para obter os segundos

    // Formata a string no formato "hh:mm:ss"
    String formattedTime =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return formattedTime;
  }
}
