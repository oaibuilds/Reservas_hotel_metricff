(define (domain hotel-ext4-hab100)
  (:requirements
      :typing
      :negative-preconditions
      :quantified-preconditions
      :conditional-effects
      :fluents
      :equality
  )

  ;; Tipos
  (:types habitacion reserva dia)

  ;; Predicados
  (:predicates
    (dia-de-reserva ?r - reserva ?d - dia)
    (ocupado ?h - habitacion ?d - dia)
    (pendiente ?r - reserva)
    (asignada ?r - reserva)
    (rechazada ?r - reserva)
    (habitacion-elegida ?r - reserva ?h - habitacion)
    (habitacion-asignada ?h - habitacion)
  )

  ;; Fluentes
  (:functions
    (capacidad ?h - habitacion)
    (tamano-reserva ?r - reserva)
    (dias-restantes ?r - reserva)
    (habitaciones-asignadas)
    (perdida1)
    (perdida2)
    (perdida3)
    (reservas-rechazadas)
  )

  ;; ===========================
  ;; Acción: ocupar un día
  ;; ===========================
  (:action ocupar-dia
    :parameters (?r - reserva ?h - habitacion ?d - dia)
    :precondition (and
        (pendiente ?r)
        (dia-de-reserva ?r ?d)
        (not (ocupado ?h ?d))
        (<= (tamano-reserva ?r) (capacidad ?h))
        (forall (?h2 - habitacion)
          (imply (habitacion-elegida ?r ?h2)
                 (= ?h2 ?h)))
    )
    :effect (and
        (ocupado ?h ?d)
        (decrease (dias-restantes ?r) 1)
        (habitacion-elegida ?r ?h)
    )
  )

  ;; ===========================
  ;; Acción: finalizar reserva (reserva aceptada)
  ;; ===========================
  (:action finalizar-reserva
    :parameters (?r - reserva)
    :precondition (and
        (pendiente ?r)
        (= (dias-restantes ?r) 0)
        (exists (?h - habitacion)
          (habitacion-elegida ?r ?h))
    )
    :effect (and
        (asignada ?r)
        (not (pendiente ?r))

        ;; ===========================
        ;; Extensión 4: contar habitaciones distintas usadas.
        ;; Versión experimento 11:
        ;; Abrir una habitación nueva es MUY caro (100).
        ;; ===========================
        (forall (?h - habitacion)
          (when (and (habitacion-elegida ?r ?h)
                     (not (habitacion-asignada ?h)))
            (and
              (habitacion-asignada ?h)
              (increase (habitaciones-asignadas) 100)
            )
          )
        )

        ;; Extensión 3: pérdidas
        (forall (?h - habitacion)
          (when (and 
                  (habitacion-elegida ?r ?h)
                  (= (capacidad ?h) (+ (tamano-reserva ?r) 1)))
            (increase (perdida1) 1)
          )
        )
        (forall (?h - habitacion)
          (when (and 
                  (habitacion-elegida ?r ?h)
                  (= (capacidad ?h) (+ (tamano-reserva ?r) 2)))
            (increase (perdida2) 2)
          )
        )
        (forall (?h - habitacion)
          (when (and 
                  (habitacion-elegida ?r ?h)
                  (= (capacidad ?h) (+ (tamano-reserva ?r) 3)))
            (increase (perdida3) 3)
          )
        )
    )
  )

  ;; ===========================
  ;; Acción: rechazar reserva (igual que dominio original)
  ;; ===========================
  (:action rechazar-reserva
    :parameters (?r - reserva)
    :precondition (and
        (pendiente ?r)
        (not (exists (?h - habitacion) (habitacion-elegida ?r ?h)))
    )
    :effect (and
        (rechazada ?r)
        (not (pendiente ?r))
        (increase (reservas-rechazadas) 1000)
    )
  )
)
