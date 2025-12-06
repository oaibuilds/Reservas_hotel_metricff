(define (problem hotel-exp12-ext4-hab-vs-perdidas)
  ;; Versión base:    (:domain hotel-ext4)
  ;; Versión hab100:  (:domain hotel-ext4-hab100)
  (:domain hotel-ext4)

  (:objects
    h1 h2                   - habitacion
    r1 r2 r3 r4 r5 r6       - reserva
    d1 d2 d3 d4 d5 d6       - dia
  )

  (:init
    ;; Contadores
    (= (reservas-rechazadas) 0)
    (= (habitaciones-asignadas) 0)
    (= (perdida1) 0)
    (= (perdida2) 0)
    (= (perdida3) 0)

    ;; Capacidades
    ;; h2 es la grande (4 plazas), h1 la pequeña (1 plaza)
    (= (capacidad h1) 1)
    (= (capacidad h2) 4)

    ;; Tamaños de reservas
    ;; r1, r2 grandes (4 plazas) -> sólo caben en h2
    ;; r3..r6 pequeñas (1 plaza) -> pueden ir a h1 o h2
    (= (tamano-reserva r1) 4)
    (= (tamano-reserva r2) 4)
    (= (tamano-reserva r3) 1)
    (= (tamano-reserva r4) 1)
    (= (tamano-reserva r5) 1)
    (= (tamano-reserva r6) 1)

    ;; Todas de 1 día, sin solapamiento
    (dia-de-reserva r1 d4)
    (= (dias-restantes r1) 1)

    (dia-de-reserva r2 d2)
    (= (dias-restantes r2) 1)

    (dia-de-reserva r3 d3)
    (= (dias-restantes r3) 1)

    (dia-de-reserva r4 d1)
    (= (dias-restantes r4) 1)

    (dia-de-reserva r5 d5)
    (= (dias-restantes r5) 1)

    (dia-de-reserva r6 d6)
    (= (dias-restantes r6) 1)

    ;; Todas pendientes al inicio
    (pendiente r1)
    (pendiente r2)
    (pendiente r3)
    (pendiente r4)
    (pendiente r5)
    (pendiente r6)
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
