(define (problem hotel-basico-h2-r3-d5)
  (:domain hotel-basico)

  (:objects
      ;; Rooms
      h1 h2 - habitacion

      ;; Reservations
      r1 r2 r3 - reserva

      ;; Days
      d1 d2 d3 d4 d5 - dia
  )

  (:init

      ;; Room capacities
      (= (capacidad h1) 1)
      (= (capacidad h2) 3)

      ;; Reservation sizes
      (= (tamano-reserva r1) 1)
      (= (tamano-reserva r2) 4)
      (= (tamano-reserva r3) 3)

      ;; Reservation days and dias-restantes
      (dia-de-reserva r1 d1)
      (= (dias-restantes r1) 1)
      (dia-de-reserva r2 d3)
      (dia-de-reserva r2 d4)
      (= (dias-restantes r2) 2)
      (dia-de-reserva r3 d1)
      (dia-de-reserva r3 d2)
      (= (dias-restantes r3) 2)

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