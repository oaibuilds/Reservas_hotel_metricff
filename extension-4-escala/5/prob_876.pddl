(define (problem prob876)
  (:domain hotel-ext4)

  (:objects
      h1 h2 h3 h4 h5 - habitacion

      r1 r2 r3 r4 r5 - reserva

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
      (= (capacidad h3) 4)
      (= (capacidad h4) 4)
      (= (capacidad h5) 1)

      (= (tamano-reserva r1) 1)
      (= (tamano-reserva r2) 1)
      (= (tamano-reserva r3) 1)
      (= (tamano-reserva r4) 2)
      (= (tamano-reserva r5) 3)

      (dia-de-reserva r1 d16)
      (dia-de-reserva r1 d17)
      (dia-de-reserva r1 d18)
      (dia-de-reserva r1 d19)
      (dia-de-reserva r1 d20)
      (= (dias-restantes r1) 5)

      (dia-de-reserva r2 d17)
      (dia-de-reserva r2 d18)
      (= (dias-restantes r2) 2)

      (dia-de-reserva r3 d16)
      (= (dias-restantes r3) 1)

      (dia-de-reserva r4 d13)
      (dia-de-reserva r4 d14)
      (dia-de-reserva r4 d15)
      (= (dias-restantes r4) 3)

      (dia-de-reserva r5 d24)
      (dia-de-reserva r5 d25)
      (dia-de-reserva r5 d26)
      (dia-de-reserva r5 d27)
      (= (dias-restantes r5) 4)

      (pendiente r1)
      (pendiente r2)
      (pendiente r3)
      (pendiente r4)
      (pendiente r5)
  )

  (:goal
    (forall (?r - reserva) (or (asignada ?r) (rechazada ?r)))
  )

  (:metric minimize (+ (reservas-rechazadas) (+ (habitaciones-asignadas) (+ (perdida1) (+ (perdida2) (perdida3))))))
)
