(define (problem hotel-exp5-ext3-perdidas)
  (:domain hotel-ext3)

  (:objects
      ;; Rooms
      h1 h2 - habitacion

      ;; Reservations
      r1 - reserva

      ;; Days
      d1 d2 - dia
  )

  (:init
      ;; Counters (Ext.3)
      (= (perdida1) 0)
      (= (perdida2) 0)
      (= (perdida3) 0)
      (= (reservas-rechazadas) 0)

      ;; Room capacities
      (= (capacidad h1) 2)
      (= (capacidad h2) 4)

      ;; Reservation sizes
      (= (tamano-reserva r1) 2)

      ;; Reservation days and dias-restantes
      (dia-de-reserva r1 d1)
      (dia-de-reserva r1 d2)
      (= (dias-restantes r1) 2)

      ;; Pending reservations
      (pendiente r1)
  )

  (:goal
    (forall (?r - reserva)
      (or (asignada ?r) (rechazada ?r)))
  )

  (:metric minimize
    (+ (reservas-rechazadas)
       (+ (perdida1)
          (+ (perdida2) (perdida3))))
  )

)
