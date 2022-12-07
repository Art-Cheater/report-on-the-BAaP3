Uses Crt;

function f(x: real): real;
begin
  f := 2 * power(x, 3) + 5; // Функция
end;

function f1(x: real): real;
begin
  f1 :=   1 / 2 * power(x, 4) + 5 * x; // Первообразная
end;

  // интервал
procedure granizi(var a, b: real);
begin
  repeat
    a := readreal('Введите левую границу интервала от -100 до 0 a = ');
  until (a >= -100) and (a <= 0);
  repeat
    b := readreal('Введите правую границу интервала от 0 до 100 b = ');
  until (b >= 0) and (b > a) and (b <= 100);
end;
//Процедура разбиений
procedure razbienie(var n: integer);
begin
  repeat
    n := readinteger('Введите число разбиений от 1000000 до 1000000000000 n = ');
  until (n >= 1000000) and (n <= 100000000000);
end;

//Процедура площади
procedure plos(var a, b: real; var n: integer; var h, s, y: real);

begin
  if b = 0.0 then if a = 0.0 then begin writeln('Параметры интервалов не заданы'); exit; end;
  h := (b - a) / n;
  s := f1(b) - f1(a); 
  for var i := 1 to n do 
  s := s + f(a + i * h);
  s := s * h;
  y := f1(b) - f1(a);
end;

// Процедура меню
procedure menu(var a: integer);
begin
  CLRSCR;
  writeln('Выберите действие: ');
  writeln('1 - Ввод интервала ');
  writeln('2 - Ввод кол-ва разбиений ');
  writeln('3 - Вывод площади ');
  writeln('4 - Вывод площади по формуле Ньютона-Лейбница ');
  writeln('5 - Вывод абсолютной погрешности ');
  writeln('6 - Относительная погрешность ');
  writeln('7 - Конец');
  read(a);
  CLRSCR;
end;

//Начало программы
var
  a, b, h, s, y: real;
  n, z: integer;

begin
  menu(z);    
  
  while true do
  begin
    case z of
      1: begin granizi(a, b); menu(z); end;
      2: begin razbienie(n); plos(a, b, n, h, s, y); menu(z); end;
      3: begin writeln('S=', s:0:5); if s = 0.00 then writeln('Параметры для высчитывания площади не заданы'); READKEY; menu(z); end;
      4: begin writeln('Аналитическое значение=', y:0:5); READKEY; menu(z); end;
      5: begin writeln('Абсолютная погрешность=', abs(y - s):0:5); READKEY; menu(z); end;
      6: begin writeln('Относительная погрешность=', abs(y - s) / y); READKEY; menu(z); end;
      7: begin writeln('Спасибо за внимание');  writeln('Нажмите Enter чтобы выйти из приложения...'); READKEY; exit; end;
    end;
  end;
end.