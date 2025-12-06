(define (problem prob456)
  (:domain hotel-basico)

  (:objects
      h1 h2 h3 h4 h5 - habitacion

      r1 r2 r3 r4 r5 - reserva

      d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init

      (= (capacidad h1) 4)
      (= (capacidad h2) 4)
      (= (capacidad h3) 4)
      (= (capacidad h4) 4)
      (= (capacidad h5) 1)

      (= (tamano-reserva r1) 1)
      (= (tamano-reserva r2) 3)
      (= (tamano-reserva r3) 4)
      (= (tamano-reserva r4) 1)
      (= (tamano-reserva r5) 1)

      (dia-de-reserva r1 d23)
      (dia-de-reserva r1 d24)
      (dia-de-reserva r1 d25)
      (dia-de-reserva r1 d26)
      (= (dias-restantes r1) 4)

      (dia-de-reserva r2 d2)
      (dia-de-reserva r2 d3)
      (dia-de-reserva r2 d4)
      (dia-de-reserva r2 d5)
      (= (dias-restantes r2) 4)

      (dia-de-reserva r3 d5)
      (dia-de-reserva r3 d6)
      (dia-de-reserva r3 d7)
      (= (dias-restantes r3) 3)

      (dia-de-reserva r4 d7)
      (dia-de-reserva r4 d8)
      (= (dias-restantes r4) 2)

      (dia-de-reserva r5 d24)
      (dia-de-reserva r5 d25)
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
