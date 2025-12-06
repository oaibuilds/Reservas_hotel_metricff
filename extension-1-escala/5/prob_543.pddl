(define (problem prob543)
  (:domain hotel-ext1)

  (:objects
      h1 h2 h3 h4 h5 - habitacion

      r1 r2 r3 r4 r5 - reserva

      d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init

      (= (reservas-rechazadas) 0)
      (= (capacidad h1) 2)
      (= (capacidad h2) 1)
      (= (capacidad h3) 4)
      (= (capacidad h4) 2)
      (= (capacidad h5) 3)

      (= (tamano-reserva r1) 1)
      (= (tamano-reserva r2) 1)
      (= (tamano-reserva r3) 4)
      (= (tamano-reserva r4) 4)
      (= (tamano-reserva r5) 3)

      (dia-de-reserva r1 d28)
      (dia-de-reserva r1 d29)
      (dia-de-reserva r1 d30)
      (= (dias-restantes r1) 3)

      (dia-de-reserva r2 d4)
      (dia-de-reserva r2 d5)
      (dia-de-reserva r2 d6)
      (= (dias-restantes r2) 3)

      (dia-de-reserva r3 d20)
      (= (dias-restantes r3) 1)

      (dia-de-reserva r4 d1)
      (dia-de-reserva r4 d2)
      (dia-de-reserva r4 d3)
      (= (dias-restantes r4) 3)

      (dia-de-reserva r5 d15)
      (dia-de-reserva r5 d16)
      (dia-de-reserva r5 d17)
      (dia-de-reserva r5 d18)
      (dia-de-reserva r5 d19)
      (= (dias-restantes r5) 5)

      (pendiente r1)
      (pendiente r2)
      (pendiente r3)
      (pendiente r4)
      (pendiente r5)
  )

  (:goal
    (forall (?r - reserva) (or (asignada ?r) (rechazada ?r)))
  )

  (:metric minimize (reservas-rechazadas))
)
