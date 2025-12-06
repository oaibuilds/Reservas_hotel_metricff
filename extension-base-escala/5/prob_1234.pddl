(define (problem prob1234)
  (:domain hotel-basico)

  (:objects
      h1 h2 h3 h4 h5 - habitacion

      r1 r2 r3 r4 r5 - reserva

      d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init

      (= (capacidad h1) 4)
      (= (capacidad h2) 1)
      (= (capacidad h3) 1)
      (= (capacidad h4) 1)
      (= (capacidad h5) 1)

      (= (tamano-reserva r1) 1)
      (= (tamano-reserva r2) 1)
      (= (tamano-reserva r3) 3)
      (= (tamano-reserva r4) 2)
      (= (tamano-reserva r5) 1)

      (dia-de-reserva r1 d26)
      (= (dias-restantes r1) 1)

      (dia-de-reserva r2 d12)
      (= (dias-restantes r2) 1)

      (dia-de-reserva r3 d16)
      (dia-de-reserva r3 d17)
      (dia-de-reserva r3 d18)
      (dia-de-reserva r3 d19)
      (dia-de-reserva r3 d20)
      (= (dias-restantes r3) 5)

      (dia-de-reserva r4 d15)
      (dia-de-reserva r4 d16)
      (dia-de-reserva r4 d17)
      (dia-de-reserva r4 d18)
      (dia-de-reserva r4 d19)
      (= (dias-restantes r4) 5)

      (dia-de-reserva r5 d3)
      (dia-de-reserva r5 d4)
      (= (dias-restantes r5) 2)

      (pendiente r1)
      (pendiente r2)
      (pendiente r3)
      (pendiente r4)
      (pendiente r5)
  )

  (:goal
    (forall (?r - reserva) (asignada ?r))
  )
)
