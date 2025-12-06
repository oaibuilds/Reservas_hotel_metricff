(define (problem prob543)
  (:domain hotel-ext1)

  (:objects
      h1 h2 h3 - habitacion

      r1 r2 r3 - reserva

      d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init

      (= (reservas-rechazadas) 0)
      (= (capacidad h1) 2)
      (= (capacidad h2) 1)
      (= (capacidad h3) 4)

      (= (tamano-reserva r1) 2)
      (= (tamano-reserva r2) 3)
      (= (tamano-reserva r3) 1)

      (dia-de-reserva r1 d3)
      (dia-de-reserva r1 d4)
      (dia-de-reserva r1 d5)
      (dia-de-reserva r1 d6)
      (dia-de-reserva r1 d7)
      (= (dias-restantes r1) 5)

      (dia-de-reserva r2 d15)
      (dia-de-reserva r2 d16)
      (dia-de-reserva r2 d17)
      (dia-de-reserva r2 d18)
      (dia-de-reserva r2 d19)
      (= (dias-restantes r2) 5)

      (dia-de-reserva r3 d17)
      (dia-de-reserva r3 d18)
      (dia-de-reserva r3 d19)
      (dia-de-reserva r3 d20)
      (dia-de-reserva r3 d21)
      (= (dias-restantes r3) 5)

      (pendiente r1)
      (pendiente r2)
      (pendiente r3)
  )

  (:goal
    (forall (?r - reserva) (or (asignada ?r) (rechazada ?r)))
  )

  (:metric minimize (reservas-rechazadas))
)
