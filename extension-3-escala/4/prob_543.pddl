(define (problem prob543)
  (:domain hotel-ext3)

  (:objects
      h1 h2 h3 h4 - habitacion

      r1 r2 r3 r4 - reserva

      d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init

      (= (perdida1) 0)
      (= (perdida2) 0)
      (= (perdida3) 0)
      (= (reservas-rechazadas) 0)
      (= (capacidad h1) 2)
      (= (capacidad h2) 1)
      (= (capacidad h3) 4)
      (= (capacidad h4) 2)

      (= (tamano-reserva r1) 3)
      (= (tamano-reserva r2) 1)
      (= (tamano-reserva r3) 1)
      (= (tamano-reserva r4) 4)

      (dia-de-reserva r1 d17)
      (dia-de-reserva r1 d18)
      (dia-de-reserva r1 d19)
      (dia-de-reserva r1 d20)
      (dia-de-reserva r1 d21)
      (= (dias-restantes r1) 5)

      (dia-de-reserva r2 d10)
      (dia-de-reserva r2 d11)
      (dia-de-reserva r2 d12)
      (dia-de-reserva r2 d13)
      (= (dias-restantes r2) 4)

      (dia-de-reserva r3 d28)
      (dia-de-reserva r3 d29)
      (dia-de-reserva r3 d30)
      (= (dias-restantes r3) 3)

      (dia-de-reserva r4 d4)
      (dia-de-reserva r4 d5)
      (dia-de-reserva r4 d6)
      (= (dias-restantes r4) 3)

      (pendiente r1)
      (pendiente r2)
      (pendiente r3)
      (pendiente r4)
  )

  (:goal
    (forall (?r - reserva) (or (asignada ?r) (rechazada ?r)))
  )

  (:metric minimize (+ (reservas-rechazadas) (+ (perdida1) (+ (perdida2) (perdida3)))))
)
