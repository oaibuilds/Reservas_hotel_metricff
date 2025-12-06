(define (problem hotel-prob-exp10-ext4-rech5)
  (:domain hotel-ext4-rech5)

  (:objects
      ;; Rooms
      h1 h2 h3 - habitacion

      ;; Reservations
      r1 r2 r3 - reserva

      ;; Days
      d1 d2 - dia
  )

  (:init
      ;; Counters (Ext.4)
      (= (habitaciones-asignadas) 0)
      (= (perdida1) 0)
      (= (perdida2) 0)
      (= (perdida3) 0)
      (= (reservas-rechazadas) 0)

      ;; Room capacities
      (= (capacidad h1) 2)
      (= (capacidad h2) 2)
      (= (capacidad h3) 2)

      ;; Reservation sizes
      (= (tamano-reserva r1) 2)
      (= (tamano-reserva r2) 2)
      (= (tamano-reserva r3) 2)

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
