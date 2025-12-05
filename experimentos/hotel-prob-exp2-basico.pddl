(define (problem hotel-exp2-basico-insat)
  (:domain hotel-basico)

  (:objects
    h1 h2           - habitacion
    r1 r2 r3        - reserva
    d1 d2 d3        - dia
  )

  (:init
    ;; Capacidades muy limitadas
    (= (capacidad h1) 2)
    (= (capacidad h2) 2)

    ;; Todas las reservas del mismo tamaño
    (= (tamano-reserva r1) 2)
    (= (tamano-reserva r2) 2)
    (= (tamano-reserva r3) 2)

    ;; Todas coinciden exactamente en los mismos días (1 y 2)
    (dia-de-reserva r1 d1)
    (dia-de-reserva r1 d2)
    (= (dias-restantes r1) 2)

    (dia-de-reserva r2 d1)
    (dia-de-reserva r2 d2)
    (= (dias-restantes r2) 2)

    (dia-de-reserva r3 d1)
    (dia-de-reserva r3 d2)
    (= (dias-restantes r3) 2)

    (pendiente r1)
    (pendiente r2)
    (pendiente r3)
  )

  (:goal
    (forall (?r - reserva)
      (asignada ?r))
  )
)
