(define (problem hotel-exp4-ext1-min-rechazos)
  (:domain hotel-ext1)

  (:objects
      ;; Rooms
      h1 h2 - habitacion

      ;; Reservations
      r1 r2 r3 r4 - reserva

      ;; Days
      d1 d2 d3 d4 - dia
  )

  (:init
      ;; Counters (Ext.1)
      (= (reservas-rechazadas) 0)

      ;; Room capacities
      (= (capacidad h1) 2)
      (= (capacidad h2) 2)

      ;; Reservation sizes
      (= (tamano-reserva r1) 2)
      (= (tamano-reserva r2) 2)
      (= (tamano-reserva r3) 2)
      (= (tamano-reserva r4) 2)

      ;; Reservation days and dias-restantes
      (dia-de-reserva r1 d1)
      (dia-de-reserva r1 d2)
      (= (dias-restantes r1) 2)

      (dia-de-reserva r2 d1)
      (dia-de-reserva r2 d2)
      (= (dias-restantes r2) 2)

      (dia-de-reserva r3 d1)
      (dia-de-reserva r3 d2)
      (= (dias-restantes r3) 2)

      (dia-de-reserva r4 d3)
      (dia-de-reserva r4 d4)
      (= (dias-restantes r4) 2)

      ;; Pending reservations
      (pendiente r1)
      (pendiente r2)
      (pendiente r3)
      (pendiente r4)
  )

  (:goal
    (forall (?r - reserva)
      (or (asignada ?r) (rechazada ?r)))
  )

  (:metric minimize (reservas-rechazadas))
)
