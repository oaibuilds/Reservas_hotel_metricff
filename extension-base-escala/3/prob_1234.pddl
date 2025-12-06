(define (problem prob1234)
  (:domain hotel-basico)

  (:objects
      h1 h2 h3 - habitacion

      r1 r2 r3 - reserva

      d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init

      (= (capacidad h1) 4)
      (= (capacidad h2) 1)
      (= (capacidad h3) 1)

      (= (tamano-reserva r1) 1)
      (= (tamano-reserva r2) 1)
      (= (tamano-reserva r3) 1)

      (dia-de-reserva r1 d25)
      (= (dias-restantes r1) 1)

      (dia-de-reserva r2 d8)
      (dia-de-reserva r2 d9)
      (dia-de-reserva r2 d10)
      (= (dias-restantes r2) 3)

      (dia-de-reserva r3 d1)
      (= (dias-restantes r3) 1)

      (pendiente r1)
      (pendiente r2)
      (pendiente r3)
  )

  (:goal
    (forall (?r - reserva) (asignada ?r))
  )
)
