(define (problem prob123)
  (:domain hotel-ext4)

  (:objects
      h1 h2 - habitacion

      r1 r2 - reserva

      d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init

      (= (habitaciones-asignadas) 0)
      (= (perdida1) 0)
      (= (perdida2) 0)
      (= (perdida3) 0)
      (= (reservas-rechazadas) 0)
      (= (capacidad h1) 1)
      (= (capacidad h2) 3)

      (= (tamano-reserva r1) 1)
      (= (tamano-reserva r2) 4)

      (dia-de-reserva r1 d4)
      (dia-de-reserva r1 d5)
      (dia-de-reserva r1 d6)
      (= (dias-restantes r1) 3)

      (dia-de-reserva r2 d13)
      (= (dias-restantes r2) 1)

      (pendiente r1)
      (pendiente r2)
  )

  (:goal
    (forall (?r - reserva) (or (asignada ?r) (rechazada ?r)))
  )

  (:metric minimize (+ (reservas-rechazadas) (+ (habitaciones-asignadas) (+ (perdida1) (+ (perdida2) (perdida3))))))
)
