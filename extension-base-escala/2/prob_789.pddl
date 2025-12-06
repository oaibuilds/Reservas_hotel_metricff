(define (problem prob789)
  (:domain hotel-basico)

  (:objects
      h1 h2 - habitacion

      r1 r2 - reserva

      d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init

      (= (capacidad h1) 4)
      (= (capacidad h2) 1)

      (= (tamano-reserva r1) 4)
      (= (tamano-reserva r2) 2)

      (dia-de-reserva r1 d18)
      (dia-de-reserva r1 d19)
      (dia-de-reserva r1 d20)
      (dia-de-reserva r1 d21)
      (= (dias-restantes r1) 4)

      (dia-de-reserva r2 d17)
      (dia-de-reserva r2 d18)
      (dia-de-reserva r2 d19)
      (= (dias-restantes r2) 3)

      (pendiente r1)
      (pendiente r2)
  )

  (:goal
    (forall (?r - reserva) (asignada ?r))
  )
)
