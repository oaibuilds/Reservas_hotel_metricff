(define (problem prob1234)
  (:domain hotel-ext1)

  (:objects
      h1 h2 h3 h4 - habitacion

      r1 r2 r3 r4 - reserva

      d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init

      (= (reservas-rechazadas) 0)
      (= (capacidad h1) 4)
      (= (capacidad h2) 1)
      (= (capacidad h3) 1)
      (= (capacidad h4) 1)

      (= (tamano-reserva r1) 1)
      (= (tamano-reserva r2) 1)
      (= (tamano-reserva r3) 1)
      (= (tamano-reserva r4) 3)

      (dia-de-reserva r1 d1)
      (dia-de-reserva r1 d2)
      (= (dias-restantes r1) 2)

      (dia-de-reserva r2 d26)
      (= (dias-restantes r2) 1)

      (dia-de-reserva r3 d12)
      (= (dias-restantes r3) 1)

      (dia-de-reserva r4 d16)
      (dia-de-reserva r4 d17)
      (dia-de-reserva r4 d18)
      (dia-de-reserva r4 d19)
      (dia-de-reserva r4 d20)
      (= (dias-restantes r4) 5)

      (pendiente r1)
      (pendiente r2)
      (pendiente r3)
      (pendiente r4)
  )

  (:goal
    (forall (?r - reserva) (or (asignada ?r) (rechazada ?r)))
  )

  (:metric minimize (reservas-rechazadas))
)
