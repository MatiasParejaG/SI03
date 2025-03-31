(deffacts datos
   (cadena1 B C A D E E B C E)
   (cadena2 E E B C A F E)
)

(deffunction interseccion-vectores (?lista1 ?lista2)
   (bind ?resultado (create$))  

   (foreach ?x ?lista1
      (if (and (member$ ?x ?lista2) (not (member$ ?x ?resultado))) then
         (bind ?resultado (create$ ?resultado ?x))
      )
   )

   ?resultado
)

(defrule calcular-interseccion
   ?f1 <- (cadena1 $?lista1)
   ?f2 <- (cadena2 $?lista2)
   =>
   (bind ?interseccion (interseccion-vectores (create$ $?lista1) (create$ $?lista2)))
   (printout t "Los valores repetidos en los vectores son: " ?interseccion crlf)
)
