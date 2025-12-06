(define (problem prob91011)
  (:domain hotel-ext3)

  (:objects
      h1 h2 h3 h4 h5 - habitacion

      r1 r2 r3 r4 r5 - reserva

      d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init

      (= (perdida1) 0)
      (= (perdida2) 0)
      (= (perdida3) 0)
      (= (reservas-rechazadas) 0)
      (= (capacidad h1) 1)
      (= (capacidad h2) 1)
      (= (capacidad h3) 4)
      (= (capacidad h4) 3)
      (= (capacidad h5) 3)

      (= (tamano-reserva r1) 4)
      (= (tamano-reserva r2) 3)
      (= (tamano-reserva r3) 2)
      (= (tamano-reserva r4) 4)
      (= (tamano-reserva r5) 4)

      (dia-de-reserva r1 d1)
      (dia-de-reserva r1 d2)
      (= (dias-restantes r1) 2)

      (dia-de-reserva r2 d5)
      (dia-de-reserva r2 d6)
      (dia-de-reserva r2 d7)
      (= (dias-restantes r2) 3)

      (dia-de-reserva r3 d7)
      (= (dias-restantes r3) 1)

      (dia-de-reserva r4 d13)
      (dia-de-reserva r4 d14)
      (dia-de-reserva r4 d15)
      (dia-de-reserva r4 d16)
      (dia-de-reserva r4 d17)
      (= (dias-restantes r4) 5)

      (dia-de-reserva r5 d7)
      (dia-de-reserva r5 d8)
      (= (dias-restantes r5) 2)

      (pendiente r1)
      (pendiente r2)
      (pendiente r3)
      (pendiente r4)
      (pendiente r5)
  )

  (:goal
    (forall (?r - reserva) (or (asignada ?r) (rechazada ?r)))
  )

  (:metric minimize (+ (reservas-rechazadas) (+ (perdida1) (+ (perdida2) (perdida3)))))
)
