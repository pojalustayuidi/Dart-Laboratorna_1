import 'dart:io';
import 'dart:math';

void main() {
  print('Выберите метод для нахождения корня:');
  print('1 - Метод дихотомии');
  print('2 - Метод простых итераций');

  int method = int.parse(stdin.readLineSync()!);

  // Ввод точности эпсилон
  print('Введите точность (эпсилон):');
  double epsilon = double.parse(stdin.readLineSync()!);

  if (method == 1) {
    // Ввод начала и конца отрезка для метода дихотомии
    print('Введите начало отрезка:');
    double nachalo = double.parse(stdin.readLineSync()!);

    print('Введите конец отрезка:');
    double conec = double.parse(stdin.readLineSync()!);

    double root = dixtomia(nachalo, conec, epsilon);
    print('Корень методом дихотомии: $root');
    print('Точность (эпсилон): $epsilon');
  } else if (method == 2) {
    // Ввод начального приближения для метода простых итераций
    print('Введите начальное приближение x0 для метода итераций:');
    double x0 = double.parse(stdin.readLineSync()!);

    double root = simpleIteration(x0, epsilon);
    print('Корень методом простых итераций: $root');
    print('Точность (эпсилон): $epsilon');
  } else {
    print('Неверный выбор метода.');
  }
}

// Функция f(x) для нахождения корня
double f(double x) {
  return x + log(x) / log(10) - 0.5;
}

// Метод дихотомии
double dixtomia(double nachalo, double conec, double epsilon) {
  int iteration = 0;
  double sr; // Средняя точка отрезка

  // Алгоритм дихотомии
  while ((conec - nachalo).abs() > epsilon) {
    sr = (nachalo + conec) / 2;

    if (f(nachalo) * f(sr) < 0) {
      conec = sr;
    } else {
      nachalo = sr;
    }
    iteration++;
  }

  double root = (nachalo + conec) / 2;
  print('Метод дихотомии: $root, кол-во итераций: $iteration');
  return root;
}

// Функция φ(x) для метода простых итераций
double phi(double x) {
  return 0.5 - log(x) / log(10);
}

// Метод простых итераций
double simpleIteration(double x0, double epsilon) {
  int iteration = 0;
  double x = x0; // Текущее приближение
  double xNew; // Новое приближение

  do {
    xNew = phi(x);
    iteration++;
    if ((xNew - x).abs() < epsilon) {
      x = xNew;
      break;
    }
    x = xNew;
  } while (true);

  print('Метод простых итераций: $x, кол-во итераций: $iteration');
  return x;
}
