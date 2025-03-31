(deffunction minimo-lista (?lista)
   (if (eq (length$ ?lista) 1) then 
       (nth$ 1 ?lista) 
   else 
       (min (nth$ 1 ?lista) (minimo-lista (rest$ ?lista))) 
   )
)

(deffacts valores
   (numeros 5 3 9 1 4 7)
)

(defrule calcular-minimo
   ?f <- (numeros $?lista)
   =>
   (bind ?minimo (minimo-lista (create$ $?lista)))
   (printout t "El mínimo de los valores es: " ?minimo crlf)
)
