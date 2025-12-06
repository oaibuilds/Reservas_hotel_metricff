(define (problem prob45)
  (:domain hotel-ext1)

  (:objects
      h1 h2 h3 - habitacion

      r1 r2 r3 - reserva

      d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init

      (= (reservas-rechazadas) 0)
      (= (capacidad h1) 3)
      (= (capacidad h2) 4)
      (= (capacidad h3) 4)

      (= (tamano-reserva r1) 3)
      (= (tamano-reserva r2) 1)
      (= (tamano-reserva r3) 3)

      (dia-de-reserva r1 d1)
      (dia-de-reserva r1 d2)
      (dia-de-reserva r1 d3)
      (= (dias-restantes r1) 3)

      (dia-de-reserva r2 d16)
      (= (dias-restantes r2) 1)

      (dia-de-reserva r3 d4)
      (= (dias-restantes r3) 1)

      (pendiente r1)
      (pendiente r2)
      (pendiente r3)
  )

  (:goal
    (forall (?r - reserva) (or (asignada ?r) (rechazada ?r)))
  )

  (:metric minimize (reservas-rechazadas))
)
