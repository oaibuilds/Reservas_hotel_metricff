(define (problem prob321)
  (:domain hotel-basico)

  (:objects
      h1 h2 - habitacion

      r1 r2 - reserva

      d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init

      (= (capacidad h1) 3)
      (= (capacidad h2) 4)

      (= (tamano-reserva r1) 2)
      (= (tamano-reserva r2) 3)

      (dia-de-reserva r1 d15)
      (dia-de-reserva r1 d16)
      (dia-de-reserva r1 d17)
      (dia-de-reserva r1 d18)
      (dia-de-reserva r1 d19)
      (= (dias-restantes r1) 5)

      (dia-de-reserva r2 d24)
      (dia-de-reserva r2 d25)
      (dia-de-reserva r2 d26)
      (= (dias-restantes r2) 3)

      (pendiente r1)
      (pendiente r2)
  )

  (:goal
    (forall (?r - reserva) (asignada ?r))
  )
)
