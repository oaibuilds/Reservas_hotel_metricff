(define (problem hotel-exp3-ext1-imposible)
  (:domain hotel-ext1)

  (:objects
      ;; Rooms
      h1 h2 h3 - habitacion

      ;; Reservations
      r1 r2 r3 - reserva

      ;; Days
      d1 d2 d3 d4 - dia
  )

  (:init
      ;; Counters (Ext.1)
      (= (reservas-rechazadas) 0)

      ;; Room capacities
      (= (capacidad h1) 2)
      (= (capacidad h2) 3)
      (= (capacidad h3) 4)

      ;; Reservation sizes
      (= (tamano-reserva r1) 2)
      (= (tamano-reserva r2) 3)
      (= (tamano-reserva r3) 5)

      ;; Reservation days and dias-restantes
      (dia-de-reserva r1 d1)
      (dia-de-reserva r1 d2)
      (= (dias-restantes r1) 2)

      (dia-de-reserva r2 d2)
      (dia-de-reserva r2 d3)
      (dia-de-reserva r2 d4)
      (= (dias-restantes r2) 3)

      (dia-de-reserva r3 d1)
      (dia-de-reserva r3 d2)
      (dia-de-reserva r3 d3)
      (= (dias-restantes r3) 3)

      ;; Pending reservations
      (pendiente r1)
      (pendiente r2)
      (pendiente r3)
  )

  (:goal
    (forall (?r - reserva)
      (or (asignada ?r) (rechazada ?r)))
  )

  (:metric minimize (reservas-rechazadas))
)
