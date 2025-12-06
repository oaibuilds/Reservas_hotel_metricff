(define (problem prob321)
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
      (= (capacidad h1) 3)
      (= (capacidad h2) 4)
      (= (capacidad h3) 2)
      (= (capacidad h4) 3)
      (= (capacidad h5) 4)

      (= (tamano-reserva r1) 3)
      (= (tamano-reserva r2) 2)
      (= (tamano-reserva r3) 4)
      (= (tamano-reserva r4) 4)
      (= (tamano-reserva r5) 4)

      (dia-de-reserva r1 d8)
      (dia-de-reserva r1 d9)
      (dia-de-reserva r1 d10)
      (dia-de-reserva r1 d11)
      (= (dias-restantes r1) 4)

      (dia-de-reserva r2 d25)
      (= (dias-restantes r2) 1)

      (dia-de-reserva r3 d9)
      (dia-de-reserva r3 d10)
      (dia-de-reserva r3 d11)
      (dia-de-reserva r3 d12)
      (dia-de-reserva r3 d13)
      (= (dias-restantes r3) 5)

      (dia-de-reserva r4 d2)
      (dia-de-reserva r4 d3)
      (dia-de-reserva r4 d4)
      (dia-de-reserva r4 d5)
      (= (dias-restantes r4) 4)

      (dia-de-reserva r5 d19)
      (dia-de-reserva r5 d20)
      (dia-de-reserva r5 d21)
      (dia-de-reserva r5 d22)
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
