(define (problem hotel-basico-h10-r3-d20)
  (:domain hotel-basico)

  (:objects
      ;; Rooms
      h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 - habitacion

      ;; Reservations
      r1 r2 r3 - reserva

      ;; Days
      d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 d19 d20 - dia
  )

  (:init

      ;; Room capacities
      (= (capacidad h1) 3)
      (= (capacidad h2) 4)
      (= (capacidad h3) 4)
      (= (capacidad h4) 3)
      (= (capacidad h5) 4)
      (= (capacidad h6) 4)
      (= (capacidad h7) 3)
      (= (capacidad h8) 3)
      (= (capacidad h9) 4)
      (= (capacidad h10) 4)

      ;; Reservation sizes
      (= (tamano-reserva r1) 4)
      (= (tamano-reserva r2) 4)
      (= (tamano-reserva r3) 4)

      ;; Reservation days and dias-restantes
      (dia-de-reserva r1 d1)
      (= (dias-restantes r1) 1)
      (dia-de-reserva r2 d13)
      (= (dias-restantes r2) 1)
      (dia-de-reserva r3 d2)
      (= (dias-restantes r3) 1)

      ;; Pending reservations
      (pendiente r1)
      (pendiente r2)
      (pendiente r3)
  )

  (:goal
    (forall (?r - reserva)
      (asignada ?r))
  )

)