(define (problem prob543)
  (:domain hotel-ext3)

  (:objects
      h1 h2 - habitacion

      r1 r2 - reserva

      d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init

      (= (perdida1) 0)
      (= (perdida2) 0)
      (= (perdida3) 0)
      (= (reservas-rechazadas) 0)
      (= (capacidad h1) 2)
      (= (capacidad h2) 1)

      (= (tamano-reserva r1) 4)
      (= (tamano-reserva r2) 2)

      (dia-de-reserva r1 d3)
      (dia-de-reserva r1 d4)
      (dia-de-reserva r1 d5)
      (= (dias-restantes r1) 3)

      (dia-de-reserva r2 d3)
      (dia-de-reserva r2 d4)
      (dia-de-reserva r2 d5)
      (dia-de-reserva r2 d6)
      (dia-de-reserva r2 d7)
      (= (dias-restantes r2) 5)

      (pendiente r1)
      (pendiente r2)
  )

  (:goal
    (forall (?r - reserva) (or (asignada ?r) (rechazada ?r)))
  )

  (:metric minimize (+ (reservas-rechazadas) (+ (perdida1) (+ (perdida2) (perdida3)))))
)
