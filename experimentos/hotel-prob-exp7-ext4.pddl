(define (problem hotel-exp7-ext4-reutilizacion)
  (:domain hotel-ext4)

  (:objects
    h1 h2           - habitacion
    r1 r2 r3        - reserva
    d1 d2 d3 d4 d5  - dia
  )

  (:init
    ;; Contadores Ext.4
    (= (reservas-rechazadas) 0)
    (= (habitaciones-asignadas) 0)
    (= (perdida1) 0)
    (= (perdida2) 0)
    (= (perdida3) 0)

    ;; Dos habitaciones iguales
    (= (capacidad h1) 3)
    (= (capacidad h2) 3)

    ;; Tres reservas "en cadena" del mismo tamaño
    (= (tamano-reserva r1) 3)
    (= (tamano-reserva r2) 3)
    (= (tamano-reserva r3) 3)

    ;; r1: d1–d2
    (dia-de-reserva r1 d1)
    (dia-de-reserva r1 d2)
    (= (dias-restantes r1) 2)

    ;; r2: d3–d4
    (dia-de-reserva r2 d3)
    (dia-de-reserva r2 d4)
    (= (dias-restantes r2) 2)

    ;; r3: d5 (1 día)
    (dia-de-reserva r3 d5)
    (= (dias-restantes r3) 1)

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
