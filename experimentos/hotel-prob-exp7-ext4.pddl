(define (problem hotel-exp7-ext4-reutilizacion)
  (:domain hotel-ext4)

  (:objects
      ;; Rooms
      h1 h2 - habitacion

      ;; Reservations
      r1 r2 r3 - reserva

      ;; Days
      d1 d2 d3 d4 d5 - dia
  )

  (:init
      ;; Counters (Ext.4)
      (= (habitaciones-asignadas) 0)
      (= (perdida1) 0)
      (= (perdida2) 0)
      (= (perdida3) 0)
      (= (reservas-rechazadas) 0)

      ;; Room capacities
      (= (capacidad h1) 3)
      (= (capacidad h2) 3)

      ;; Reservation sizes
      (= (tamano-reserva r1) 3)
      (= (tamano-reserva r2) 3)
      (= (tamano-reserva r3) 3)

      ;; Reservation days and dias-restantes
      (dia-de-reserva r1 d1)
      (dia-de-reserva r1 d2)
      (= (dias-restantes r1) 2)

      (dia-de-reserva r2 d3)
      (dia-de-reserva r2 d4)
      (= (dias-restantes r2) 2)

      (dia-de-reserva r3 d5)
      (= (dias-restantes r3) 1)

      ;; Pending reservations
      (pendiente r1)
      (pendiente r2)
      (pendiente r3)
  )

  (:goal
    (forall (?r - reserva)
      (or (asignada ?r) (rechazada ?r)))
  )

  (:metric minimize
    (+ (reservas-rechazadas)
       (+ (habitaciones-asignadas)
          (+ (perdida1)
             (+ (perdida2) (perdida3)))))
  )

)
