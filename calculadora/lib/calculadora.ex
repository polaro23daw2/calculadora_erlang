defmodule Calculadora do
  # Define una función 'suma' que toma dos argumentos, a y b.
  # Esta función delega su ejecución a una función del módulo Erlang 'calculadora' con el mismo nombre.
  def suma(a, b) do
    :calculadora.suma(a, b)
  end

  # Define una función 'resta' similar a 'suma', que también delega su ejecución.
  def resta(a, b) do
    :calculadora.resta(a, b)
  end

  # Define una función 'multiplicacion' que sigue el mismo patrón que las funciones anteriores.
  def multiplicacion(a, b) do
    :calculadora.multiplicacion(a, b)
  end

  # Define una función 'division' que además incluye manejo de errores.
  # Utiliza una estructura 'case' para manejar diferentes resultados de la llamada a la función en Erlang.
  def division(a, b) do
    case :calculadora.division(a, b) do
      :error -> {:error, "División por cero"}  # Si el resultado es :error, retorna una tupla con un mensaje de error.
      result -> result                         # En cualquier otro caso, simplemente retorna el resultado.
    end
  end

  # Define una función 'equacion_segundoGrado' que calcula las raíces de una ecuación cuadrática.
  # La función toma tres argumentos, a, b, y c, y delega su ejecución al módulo Erlang 'calculadora'.
  def equacion_segundoGrado(a, b, c) do
    :calculadora.equacion_segundoGrado(a, b, c)
  end

  # Función opcional que imprime instrucciones de uso cuando se invoca.
  def iniciar() do
    IO.puts("Bienvenido al módulo Calculadora de Elixir.")
    IO.puts("Utiliza las siguientes funciones para realizar operaciones matemáticas:")
    IO.puts("  - Calculadora.suma(a, b)")
    IO.puts("  - Calculadora.resta(a, b)")
    IO.puts("  - Calculadora.multiplicacion(a, b)")
    IO.puts("  - Calculadora.division(a, b)")
    IO.puts("  - Calculadora.equacion_segundoGrado(a, b, c)")
  end
end
