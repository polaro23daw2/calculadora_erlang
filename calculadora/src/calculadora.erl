% Define el módulo con el nombre 'calculadora'
-module(calculadora).

% Exporta las funciones con sus aridades para que sean accesibles desde otros módulos o la shell de Erlang
-export([suma/2, resta/2, multiplicacion/2, division/2, equacion_segundoGrado/3, iniciar/0]).


% iniicar con Calculadora.iniciar



% Define la función iniciar que imprime un mensaje de bienvenida y cómo ejecutar las funciones
iniciar() ->
    io:format("Bienvenido al modulo calculadora.~n"),
    io:format("Uso:~n"),
    io:format("  calculadora:suma(A, B).~n"),
    io:format("  calculadora:resta(A, B).~n"),
    io:format("  calculadora:multiplicacion(A, B).~n"),
    io:format("  calculadora:division(A, B).~n"),
    io:format("  calculadora:equacion_segundoGrado(A, B, C).~n").

% Define la función suma, que toma dos argumentos A y B y devuelve su suma
suma(A, B) -> A + B.

% Define la función resta, que toma dos argumentos A y B y devuelve su diferencia
resta(A, B) -> A - B.

% Define la función multiplicacion, que toma dos argumentos A y B y devuelve su producto
multiplicacion(A, B) -> A * B.

% Define la función division, que toma dos argumentos A y B.
% Esta función maneja el caso especial donde B es cero para evitar divisiones por cero.
division(A, B) ->
    case B of
        0 -> error(div_by_zero); % Si B es cero, devuelve un error indicando división por cero
        _ -> A / B               % En cualquier otro caso, realiza la división normal
    end.

% Define la función equacion_segundoGrado que resuelve ecuaciones de segundo grado.
% Asume que A es diferente de cero. Si A es cero, devuelve un error.
equacion_segundoGrado(A, B, C) when A =/= 0 ->
    Discriminante = B*B - 4*A*C, % Calcula el discriminante de la ecuación
    case Discriminante >= 0 of
        true ->
            RaizDisc = math:sqrt(Discriminante), % Calcula la raíz cuadrada del discriminante
            X1 = (-B + RaizDisc) / (2 * A), % Calcula una de las raíces usando la fórmula cuadrática
            X2 = (-B - RaizDisc) / (2 * A), % Calcula la otra raíz usando la fórmula cuadrática
            {X1, X2}; % Devuelve las dos raíces como una tupla
        false ->
            Real = -B / (2 * A), % Calcula la parte real de las raíces complejas
            Imaginario = math:sqrt(-Discriminante) / (2 * A), % Calcula la parte imaginaria de las raíces complejas
            {{Real, Imaginario}, {Real, -Imaginario}} % Devuelve las raíces complejas como dos tuplas
    end;
equacion_segundoGrado(_, _, _) ->
    error(invalid_parameters). % Devuelve un error si A es cero
