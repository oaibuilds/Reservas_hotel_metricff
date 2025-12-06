(define (problem prob45)
  (:domain hotel-basico)

  (:objects
      h1 h2 - habitacion

      r1 r2 - reserva

      d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init

      (= (capacidad h1) 3)
      (= (capacidad h2) 4)

      (= (tamano-reserva r1) 4)
      (= (tamano-reserva r2) 3)

      (dia-de-reserva r1 d10)
      (= (dias-restantes r1) 1)

      (dia-de-reserva r2 d1)
      (dia-de-reserva r2 d2)
      (dia-de-reserva r2 d3)
      (= (dias-restantes r2) 3)

      (pendiente r1)
      (pendiente r2)
  )

  (:goal
    (forall (?r - reserva) (asignada ?r))
  )
)
