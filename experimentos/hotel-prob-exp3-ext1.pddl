(define (problem hotel-exp3-ext1-imposible)
  (:domain hotel-ext1)

  (:objects
    h1 h2 h3        - habitacion
    r1 r2 r3        - reserva
    d1 d2 d3 d4     - dia
  )

  (:init
    ;; Contador de reservas rechazadas
    (= (reservas-rechazadas) 0)

    ;; Capacidades de las habitaciones (máx 4)
    (= (capacidad h1) 2)
    (= (capacidad h2) 3)
    (= (capacidad h3) 4)

    ;; Tamaño de las reservas
    ;; r1 y r2 caben, r3 es imposible (tamaño 5 > todas las capacidades)
    (= (tamano-reserva r1) 2)
    (= (tamano-reserva r2) 3)
    (= (tamano-reserva r3) 5)

    ;; Días de las reservas
    ;; r1: d1–d2
    (dia-de-reserva r1 d1)
    (dia-de-reserva r1 d2)
    (= (dias-restantes r1) 2)

    ;; r2: d2–d4
    (dia-de-reserva r2 d2)
    (dia-de-reserva r2 d3)
    (dia-de-reserva r2 d4)
    (= (dias-restantes r2) 3)

    ;; r3: d1–d3 (imposible por capacidad, no por días)
    (dia-de-reserva r3 d1)
    (dia-de-reserva r3 d2)
    (dia-de-reserva r3 d3)
    (= (dias-restantes r3) 3)

    ;; Todas pendientes al inicio
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
