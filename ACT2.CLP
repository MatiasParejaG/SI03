(deffunction suma-lista (?lista)
   (if (eq (length$ ?lista) 0) then 
       0
   else 
       (+ (nth$ 1 ?lista) (suma-lista (rest$ ?lista)))
   )
)

(deffacts valores
   (numeros 3 7 2 8 4)
)

(defrule calcular-suma
   ?f <- (numeros $?lista)
   =>
   (bind ?resultado (suma-lista (create$ $?lista)))
   (printout t "La suma de los valores es: " ?resultado crlf)
)

