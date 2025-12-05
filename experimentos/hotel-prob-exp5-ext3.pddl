(define (problem hotel-exp5-ext3-perdidas)
  (:domain hotel-ext3)

  (:objects
    h1 h2       - habitacion
    r1          - reserva
    d1 d2       - dia
  )

  (:init
    ;; Contadores numéricos
    (= (reservas-rechazadas) 0)
    (= (perdida1) 0)
    (= (perdida2) 0)
    (= (perdida3) 0)

    ;; Dos habitaciones: una ajustada, otra grande
    (= (capacidad h1) 2)  ;; ajustada
    (= (capacidad h2) 4)  ;; genera pérdidas si se usa

    ;; Una reserva de 2 personas
    (= (tamano-reserva r1) 2)

    ;; r1 ocupa los días d1–d2
    (dia-de-reserva r1 d1)
    (dia-de-reserva r1 d2)
    (= (dias-restantes r1) 2)

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
