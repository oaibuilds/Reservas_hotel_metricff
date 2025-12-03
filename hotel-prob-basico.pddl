(define (problem prueba-basico-30dias)
  (:domain hotel-basico)

  (:objects
      ;; Habitaciones
      h1 h2 - habitacion

      ;; Reservas
      r1 r2 r3 - reserva

      ;; Días del 1 al 30
      d1 d2 d3 d4 d5 d6 d7 d8 d9 d10
      d11 d12 d13 d14 d15 d16 d17 d18 d19 d20
      d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 - dia
  )

  (:init

      ;; ----------------------------------
      ;; Capacidades de habitaciones
      ;; ----------------------------------
      (= (capacidad h1) 2)
      (= (capacidad h2) 4)

      ;; ----------------------------------
      ;; Tamaño de las reservas (1–4 personas)
      ;; ----------------------------------
      (= (tamano-reserva r1) 2)   ;; 2 personas
      (= (tamano-reserva r2) 3)   ;; 3 personas
      (= (tamano-reserva r3) 1)   ;; 1 persona

      ;; ----------------------------------
      ;; r1: del día 2 al 4  (inicio=2, fin=4)
      ;; ----------------------------------
      (dia-de-reserva r1 d2)
      (dia-de-reserva r1 d3)
      (dia-de-reserva r1 d4)
      (= (dias-restantes r1) 3)

      ;; ----------------------------------
      ;; r2: del día 5 al 7  (inicio=5, fin=7)
      ;; ----------------------------------
      (dia-de-reserva r2 d5)
      (dia-de-reserva r2 d6)
      (dia-de-reserva r2 d7)
      (= (dias-restantes r2) 3)

      ;; ----------------------------------
      ;; r3: del día 10 al 12 (inicio=10, fin=12)
      ;; ----------------------------------
      (dia-de-reserva r3 d10)
      (dia-de-reserva r3 d11)
      (dia-de-reserva r3 d12)
      (= (dias-restantes r3) 3)

      ;; ----------------------------------
      ;; Todas las reservas pendientes
      ;; ----------------------------------
      (pendiente r1)
      (pendiente r2)
      (pendiente r3)
  )

  ;; ----------------------------------
  ;; Objetivo: asignar todas las reservas.
  ;; La habitación concreta la decide el planificador
  ;; respetando capacidad y no solapamiento.
  ;; ----------------------------------
  (:goal
    (forall (?r - reserva)
      (asignada ?r) 
  )

)
)