(define (problem hotel-exp4-ext1-min-rechazos)
  (:domain hotel-ext1)

  (:objects
    h1 h2           - habitacion
    r1 r2 r3 r4     - reserva
    d1 d2 d3 d4     - dia
  )

  (:init
    ;; Contador numérico
    (= (reservas-rechazadas) 0)

    ;; Dos habitaciones pequeñas
    (= (capacidad h1) 2)
    (= (capacidad h2) 2)

    ;; Cuatro reservas del mismo tamaño
    (= (tamano-reserva r1) 2)
    (= (tamano-reserva r2) 2)
    (= (tamano-reserva r3) 2)
    (= (tamano-reserva r4) 2)

    ;; r1, r2, r3 se solapan fuertemente (d1–d2)
    (dia-de-reserva r1 d1)
    (dia-de-reserva r1 d2)
    (= (dias-restantes r1) 2)

    (dia-de-reserva r2 d1)
    (dia-de-reserva r2 d2)
    (= (dias-restantes r2) 2)

    (dia-de-reserva r3 d1)
    (dia-de-reserva r3 d2)
    (= (dias-restantes r3) 2)

    ;; r4 está en otro tramo (d3–d4), no compite con las primeras
    (dia-de-reserva r4 d3)
    (dia-de-reserva r4 d4)
    (= (dias-restantes r4) 2)

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
