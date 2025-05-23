(deftemplate Pais
   (slot Nombre)
   (multislot Bandera)
)

(deftemplate ColoresABuscar
   (multislot Colores)
)

(deffunction subset-check (?colores-busqueda ?colores-bandera)
   (if (eq (length$ ?colores-busqueda) 0) then TRUE  
      else
      (if (member$ (first$ ?colores-busqueda) ?colores-bandera)
         then (subset-check (rest$ ?colores-busqueda) ?colores-bandera)
         else FALSE
      )
   )
)

(deffacts Paises
   (Pais (Nombre Argentina) (Bandera Blanco Celeste))
   (Pais (Nombre Bolivia) (Bandera Rojo Amarillo Verde))
   (Pais (Nombre Brasil) (Bandera Verde Amarillo Azul Blanco))
   (Pais (Nombre Chile) (Bandera Rojo Azul Blanco))
   (Pais (Nombre Colombia) (Bandera Amarillo Azul Rojo))
   (Pais (Nombre Ecuador) (Bandera Amarillo Azul Rojo))
   (Pais (Nombre Paraguay) (Bandera Rojo Blanco Azul))
   (Pais (Nombre Perú) (Bandera Rojo Blanco))
   (Pais (Nombre Uruguay) (Bandera Blanco Azul Amarillo))
   (Pais (Nombre Venezuela) (Bandera Amarillo Azul Rojo))
)

(defrule Buscar-Paises
   ?colores <- (ColoresABuscar (Colores $?listaColores))
   ?pais <- (Pais (Nombre ?nombre) (Bandera $?coloresBandera))
   (test (subset-check $?listaColores $?coloresBandera))
   =>
   (printout t "El país que contiene todos los colores buscados en su bandera es: " ?nombre crlf)
)
