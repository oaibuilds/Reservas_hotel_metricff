(define (problem hotel-exp1-basico)
  (:domain hotel-basico)

  (:objects
    h1 h2           - habitacion
    r1 r2 r3        - reserva
    d1 d2 d3 d4 d5  - dia
  )

  (:init
    ;; Capacidades de las habitaciones
    (= (capacidad h1) 3)
    (= (capacidad h2) 4)

    ;; Tamaño de las reservas
    (= (tamano-reserva r1) 2)
    (= (tamano-reserva r2) 3)
    (= (tamano-reserva r3) 2)

    ;; Días de reserva (no hay conflicto fuerte, todo cabe)
    ;; r1: del día 1 al 2
    (dia-de-reserva r1 d1)
    (dia-de-reserva r1 d2)
    (= (dias-restantes r1) 2)

    ;; r2: del día 2 al 4
    (dia-de-reserva r2 d2)
    (dia-de-reserva r2 d3)
    (dia-de-reserva r2 d4)
    (= (dias-restantes r2) 3)

    ;; r3: del día 4 al 5
    (dia-de-reserva r3 d4)
    (dia-de-reserva r3 d5)
    (= (dias-restantes r3) 2)

    ;; Reservas inicialmente pendientes
    (pendiente r1)
    (pendiente r2)
    (pendiente r3)
  )

  (:goal
    (forall (?r - reserva)
      (asignada ?r))
  )
)
