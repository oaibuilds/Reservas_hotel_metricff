(define (problem hotel-exp1-basico)
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
      (= (capacidad h1) 3)
      (= (capacidad h2) 4)

      ;; Reservation sizes
      (= (tamano-reserva r1) 2)
      (= (tamano-reserva r2) 3)
      (= (tamano-reserva r3) 2)

      ;; Reservation days and dias-restantes
      (dia-de-reserva r1 d1)
      (dia-de-reserva r1 d2)
      (= (dias-restantes r1) 2)
      (dia-de-reserva r2 d2)
      (dia-de-reserva r2 d3)
      (dia-de-reserva r2 d4)
      (= (dias-restantes r2) 3)
      (dia-de-reserva r3 d4)
      (dia-de-reserva r3 d5)
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
