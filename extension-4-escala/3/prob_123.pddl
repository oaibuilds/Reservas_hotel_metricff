(define (problem prob123)
  (:domain hotel-ext4)

  (:objects
      h1 h2 h3 - habitacion

      r1 r2 r3 - reserva

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
      (= (capacidad h3) 1)

      (= (tamano-reserva r1) 4)
      (= (tamano-reserva r2) 3)
      (= (tamano-reserva r3) 1)

      (dia-de-reserva r1 d13)
      (= (dias-restantes r1) 1)

      (dia-de-reserva r2 d18)
      (dia-de-reserva r2 d19)
      (dia-de-reserva r2 d20)
      (dia-de-reserva r2 d21)
      (dia-de-reserva r2 d22)
      (= (dias-restantes r2) 5)

      (dia-de-reserva r3 d11)
      (dia-de-reserva r3 d12)
      (dia-de-reserva r3 d13)
      (= (dias-restantes r3) 3)

      (pendiente r1)
      (pendiente r2)
      (pendiente r3)
  )

  (:goal
    (forall (?r - reserva) (or (asignada ?r) (rechazada ?r)))
  )

  (:metric minimize (+ (reservas-rechazadas) (+ (habitaciones-asignadas) (+ (perdida1) (+ (perdida2) (perdida3))))))
)
