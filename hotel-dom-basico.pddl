(define (domain hotel-basico)
  (:requirements 
      :typing 
      :negative-preconditions
      :quantified-preconditions
      :conditional-effects
      :fluents
      :equality              ; necesario por (= ?h2 ?h)
  )

  ;; Tipos
  (:types habitacion reserva dia)

  ;; Predicados
  (:predicates
    (dia-de-reserva ?r - reserva ?d - dia)
    (ocupado ?h - habitacion ?d - dia)
    (pendiente ?r - reserva)
    (asignada ?r - reserva)                    ; ahora solo depende de la reserva
    (habitacion-elegida ?r - reserva ?h - habitacion)
  )

  ;; Fluentes
  (:functions
    (capacidad ?h - habitacion)
    (tamano-reserva ?r - reserva)
    (dias-restantes ?r - reserva)
  )

  ;; ===========================
  ;; Acción: Ocupar un día
  ;; ===========================
  (:action ocupar-dia
    :parameters (?r - reserva ?h - habitacion ?d - dia)
    :precondition (and
        (pendiente ?r)
        (dia-de-reserva ?r ?d)
        (not (ocupado ?h ?d))
        (<= (tamano-reserva ?r) (capacidad ?h))

        ;; Si ya hay habitación elegida, debe coincidir con ?h
        (forall (?h2 - habitacion)
           (imply (habitacion-elegida ?r ?h2)
                  (= ?h2 ?h))
        )
    )
    :effect (and
        (ocupado ?h ?d)
        (decrease (dias-restantes ?r) 1)
        (habitacion-elegida ?r ?h)
    )
  )

  ;; ===========================
  ;; Acción: Finalizar reserva
  ;; ===========================
  (:action finalizar-reserva
    :parameters (?r - reserva)
    :precondition (and
        (pendiente ?r)
        (= (dias-restantes ?r) 0)
        ;; opcional pero recomendable: asegurarse de que tiene habitación elegida
        (exists (?h - habitacion) (habitacion-elegida ?r ?h))
    )
    :effect (and
        (asignada ?r)
        (not (pendiente ?r))
    )
  )
)
