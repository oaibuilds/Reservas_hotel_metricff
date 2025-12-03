(define (problem prueba-ext-1-3-4)
  (:domain hotel)

  (:objects
      h1 h2        - habitacion
      r1 r2 r3     - reserva
      d1 d2 d3 d4 d5 - dia
  )

  (:init
      ;; Contadores a cero
      (= (perdida1) 0)
      (= (perdida2) 0)
      (= (perdida3) 0)
      (= (reservas-rechazadas) 0)

      ;; Capacidades de las habitaciones
      ;; h1 es la grande (3 plazas), h2 mediana (2 plazas)
      (= (capacidad h1) 2)
      (= (capacidad h2) 3)

      ;; Tamaño de las reservas
      ;; r1 ocupa 3 plazas dos días seguidos
      ;; r2 ocupa 2 plazas un día suelto
      (= (tamano-reserva r1) 3)
      (= (tamano-reserva r2) 2)
      (= (tamano-reserva r3) 2)  ;; r3 no se podrá asignar

      ;; Días de las reservas y "dias-restantes"
      ;; r1: ocupa d1 y d2
      (dia-de-reserva r1 d1)
      (dia-de-reserva r1 d2)
      (= (dias-restantes r1) 2)

      (dia-de-reserva r3 d3)
      (= (dias-restantes r3) 1)

      ;; r2: ocupa solo el día d3
      (dia-de-reserva r2 d5)
      (= (dias-restantes r2) 1)

      ;; Las dos reservas empiezan pendientes
      (pendiente r1)
      (pendiente r2)
      (pendiente r3)
  )

  ;; Objetivo: todas las reservas deben acabar asignadas o rechazadas
  (:goal
    (forall (?r - reserva)
      (or (asignada ?r) (rechazada ?r)))
  )

  ;; Métrica combinada (Ext. 1, 3 y 4)
  ;; Los pesos efectivos están en los incrementos del dominio:
  ;;   reservas-rechazadas += 1000
  ;;   habitaciones-asignadas += 10
  ;;   pérdida1/2/3 += 1/2/3
  (:metric minimize
    (+ (reservas-rechazadas)
          (+ (perdida1)
             (+ (perdida2) (perdida3)))))
  )
