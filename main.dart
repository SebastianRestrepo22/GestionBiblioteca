//Gestión de biblioteca
import 'dart:io';

void main() {
  // Creamos y declaramos la variable libros como una lista
  List<Map<String, dynamic>> libros = [];
  while (true) {
    print(
      "Seleccione una opción: \n" +
          "1. Agregar un libro. \n" +
          "2. Listar libros. \n" +
          "3. Actualizar libro. \n" +
          "4. Eliminar libro. \n" +
          "5. Salir." +
          "",
    );

    int? opcion = int.tryParse(
      stdin.readLineSync()!,
    ); //varible que se utiliza para almacenar

    print('');

    switch (opcion) {
      case 1:
        //Opción 1 para crear un libro
        String? titulo;
        /*do → Se ejecuta el bloque de código al menos una vez.

        while (condición) → Después de ejecutar el bloque, se evalúa la condición.

        Si la condición es verdadera, el bloque se repite.

        Si es falsa, el ciclo termina.*/
        do {
          print('Ingrese el titulo del libro: ');
          titulo = stdin.readLineSync();

          if (titulo == null || titulo.trim().isEmpty) {
            print('No pueden ir campos vacíos.');
            print('');
          }
        } while (titulo == null || titulo.trim().isEmpty);

        String? autor;
        do {
          print('Ingrese el autor del libro: ');
          autor = stdin.readLineSync();

          if (autor == null || autor.trim().isEmpty) {
            print('No pueden ir campos vacíos.');
            print('');
          }
        } while (autor == null || autor.trim().isEmpty);

        String? year;
        do {
          print('Ingrese el año de publicación del libro: ');
          year = stdin.readLineSync();

          if (year == null || year.trim().isEmpty) {
            print('No pueden ir campos vacíos.');
            print('');
          }
        } while (year == null || year.trim().isEmpty);

        //Se declara el mapa y como clave es String y el valor es dinamico
        Map<String, dynamic> libro = {
          'titulo': titulo,
          'autor': autor,
          'year': year,
        };

        //Agregamos un libro
        libros.add(libro);

        print("Libro creado exitosamente.");

        print('');
        break;
      case 2:
        //Listamos los libros registrados
        // print(libros.length == 0 ? 'No hay libros registrados.' : libros);
        if (libros.length == 0) {
          print('No hay libros registrados');
          print('');
          break;
        }
        for (var i = 0; i < libros.length; i++) {
          print(
            "${i + 1}. ${libros[i]['titulo']} - ${libros[i]['autor']} (${libros[i]['year']})",
          );
        }
        print('');

        break;
      case 3:
        //Editar libros registrados
        if (libros.length == 0) {
          print('No hay libros registrados');
          print('');
          break;
        }

        /*
        1. Se crea una variable i y se le da el valor de 0, este a la vez es el ídice que utilizaremos por cada elemneto
        de la lista.
        2. i < libros.length: es la condición El bucle se ejecuta mientras la condición sea verdadera.
        libros.length es la cantidad total de elementos en la lista libros.
        Si i llega a ser igual o mayor a libros.length, el bucle se detiene.
        3. ++1 Después de cada vuelta, se incrementa i en 1.
        */

        for (var i = 0; i < libros.length; i++) {
          print(
            "${i + 1}. ${libros[i]['titulo']} - ${libros[i]['autor']} (${libros[i]['year']})",
          );
        }
        print('');

        print("Ingrese el número del libro a actualizar: ");
        int? indice = int.tryParse(stdin.readLineSync()!);

        if (indice == null || indice < 1 || indice > libros.length) {
          print("Índice inválido.");
          break;
        }

        print("Nuevo título: (Enter para mantener el actual): ");
        String? titulo = stdin.readLineSync();

        if (titulo != null && titulo.trim().isNotEmpty) {
          //Se le resta 1 porque indice empieza en 1 (humano) y las listas en Dart son indexadas desde 0.
          //Después se accede a la clave titulo, y se guarda la variable en el mapa y se eliminan los espacios con .trim()
          libros[indice - 1]['titulo'] = titulo.trim();
        }

        print("Nuevo autor: (Enter para mantener el actual): ");
        String? autor = stdin.readLineSync();

        if (autor != null && autor.trim().isNotEmpty) {
          libros[indice - 1]['autor'] = autor.trim();
        }

        print("Nuevo año: (Enter para mantener el actual): ");
        String? year = stdin.readLineSync();

        if (year != null && year.trim().isNotEmpty) {
          libros[indice - 1]['year'] = year.trim();
        }

        //Se usa indice - 1 porque normalmente en las listas los índices empiezan en 0,
        //pero tal vez el usuario está eligiendo un libro con numeración que empieza en 1.

        print("Libro actualizado. ");
        print('');
        break;
      case 4:
        //Eliminar
        if (libros.length == 0) {
          print('No hay libros registrados');
          print('');

          break;
        }

        for (var i = 0; i < libros.length; i++) {
          print(
            "${i + 1}. ${libros[i]['titulo']} - ${libros[i]['autor']} (${libros[i]['year']})",
          );
        }

        print("Ingrese el número del libro a eliminar: ");
        int? indice = int.tryParse(stdin.readLineSync() ?? '');

        if (indice == null || indice < 1 || indice > libros.length) {
          print("Índice inválido.");
          break;
        }

        libros.removeAt(indice - 1);
        print("Libro eliminado exitosamente.");
        print('');

        break;
      case 5:
        print("Saliendo del aplicativo...");
        return;
      default:
        print("La opción selecionada, es incorrecta.");
        print('');
    }
  }
}
