(define (problem hotel-exp6-ext3-comp-ext1)
  (:domain hotel-ext3)

  (:objects
    h1 h2           - habitacion
    r1 r2 r3 r4     - reserva
    d1 d2 d3        - dia
  )

  (:init
    ;; Contadores de Ext.3
    (= (reservas-rechazadas) 0)
    (= (perdida1) 0)
    (= (perdida2) 0)
    (= (perdida3) 0)

    ;; Dos habitaciones con capacidades distintas
    (= (capacidad h1) 2)  ;; ajustada
    (= (capacidad h2) 4)  ;; más holgada

    ;; Cuatro reservas de 2 personas
    (= (tamano-reserva r1) 2)
    (= (tamano-reserva r2) 2)
    (= (tamano-reserva r3) 2)
    (= (tamano-reserva r4) 2)

    ;; Competencia en d1 y d2, d3 ligeramente más despejado
    ;; r1 y r2: d1–d2
    (dia-de-reserva r1 d1)
    (dia-de-reserva r1 d2)
    (= (dias-restantes r1) 2)

    (dia-de-reserva r2 d1)
    (dia-de-reserva r2 d2)
    (= (dias-restantes r2) 2)

    ;; r3: d1–d3
    (dia-de-reserva r3 d1)
    (dia-de-reserva r3 d2)
    (dia-de-reserva r3 d3)
    (= (dias-restantes r3) 3)

    ;; r4: d2–d3
    (dia-de-reserva r4 d2)
    (dia-de-reserva r4 d3)
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

  (:metric minimize
    (+ (reservas-rechazadas)
       (+ (perdida1)
          (+ (perdida2) (perdida3))))
  )
)
