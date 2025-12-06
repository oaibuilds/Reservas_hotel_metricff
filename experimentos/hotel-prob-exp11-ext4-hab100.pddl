(define (problem hotel-prob-exp11-ext4-hab100)
  (:domain hotel-ext4-hab100)

  (:objects
      ;; Rooms
      h1 h2 h3 - habitacion

      ;; Reservations
      r1 r2 r3 r4 r5 r6 r7 - reserva

      ;; Days
      d1 d2 d3 d4 d5 d6 d7 d8 - dia
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
      (= (capacidad h2) 3)
      (= (capacidad h3) 4)

      ;; Reservation sizes
      (= (tamano-reserva r1) 2)
      (= (tamano-reserva r2) 3)
      (= (tamano-reserva r3) 1)
      (= (tamano-reserva r4) 4)
      (= (tamano-reserva r5) 2)
      (= (tamano-reserva r6) 3)
      (= (tamano-reserva r7) 2)

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

      (dia-de-reserva r4 d3)
      (dia-de-reserva r4 d4)
      (dia-de-reserva r4 d5)
      (= (dias-restantes r4) 3)

      (dia-de-reserva r5 d4)
      (dia-de-reserva r5 d5)
      (dia-de-reserva r5 d6)
      (= (dias-restantes r5) 3)

      (dia-de-reserva r6 d5)
      (dia-de-reserva r6 d6)
      (dia-de-reserva r6 d7)
      (= (dias-restantes r6) 3)

      (dia-de-reserva r7 d6)
      (dia-de-reserva r7 d7)
      (dia-de-reserva r7 d8)
      (= (dias-restantes r7) 3)

      ;; Pending reservations
      (pendiente r1)
      (pendiente r2)
      (pendiente r3)
      (pendiente r4)
      (pendiente r5)
      (pendiente r6)
      (pendiente r7)
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
