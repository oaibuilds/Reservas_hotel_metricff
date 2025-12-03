(define (domain hotel)
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
  )

  ;; Fluentes
  (:functions
    (capacidad ?h - habitacion)
    (tamano-reserva ?r - reserva)
    (dias-restantes ?r - reserva)
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
        ;; Garantizar que toda la reserva usa siempre la misma habitación:
        ;; si ya hay una habitacion-elegida, debe ser la misma que ?h
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

        
    )
  )

  ;; ===========================
  ;; Acción: rechazar reserva (Extensión 1)
  ;; ===========================
  (:action rechazar-reserva
    :parameters (?r - reserva)
    :precondition (and
        (pendiente ?r)
        ;; Solo permitir rechazo si no se ha elegido habitación
        (not (exists (?h - habitacion) (habitacion-elegida ?r ?h)))
    )
    :effect (and
        (rechazada ?r)
        (not (pendiente ?r))
        ;; Extensión 1:
        ;; Incremento constante grande (1000) para que el planificador
        ;; priorice minimizar reservas rechazadas por encima del resto.
        (increase (reservas-rechazadas) 1000)
    )
  )
)
