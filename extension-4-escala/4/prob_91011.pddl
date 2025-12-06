(define (problem prob91011)
  (:domain hotel-ext4)

  (:objects
      h1 h2 h3 h4 - habitacion

      r1 r2 r3 r4 - reserva

      d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init

      (= (habitaciones-asignadas) 0)
      (= (perdida1) 0)
      (= (perdida2) 0)
      (= (perdida3) 0)
      (= (reservas-rechazadas) 0)
      (= (capacidad h1) 1)
      (= (capacidad h2) 1)
      (= (capacidad h3) 4)
      (= (capacidad h4) 3)

      (= (tamano-reserva r1) 3)
      (= (tamano-reserva r2) 4)
      (= (tamano-reserva r3) 3)
      (= (tamano-reserva r4) 2)

      (dia-de-reserva r1 d25)
      (dia-de-reserva r1 d26)
      (dia-de-reserva r1 d27)
      (dia-de-reserva r1 d28)
      (dia-de-reserva r1 d29)
      (= (dias-restantes r1) 5)

      (dia-de-reserva r2 d16)
      (dia-de-reserva r2 d17)
      (dia-de-reserva r2 d18)
      (dia-de-reserva r2 d19)
      (dia-de-reserva r2 d20)
      (= (dias-restantes r2) 5)

      (dia-de-reserva r3 d6)
      (dia-de-reserva r3 d7)
      (dia-de-reserva r3 d8)
      (dia-de-reserva r3 d9)
      (= (dias-restantes r3) 4)

      (dia-de-reserva r4 d12)
      (= (dias-restantes r4) 1)

      (pendiente r1)
      (pendiente r2)
      (pendiente r3)
      (pendiente r4)
  )

  (:goal
    (forall (?r - reserva) (or (asignada ?r) (rechazada ?r)))
  )

  (:metric minimize (+ (reservas-rechazadas) (+ (habitaciones-asignadas) (+ (perdida1) (+ (perdida2) (perdida3))))))
)
