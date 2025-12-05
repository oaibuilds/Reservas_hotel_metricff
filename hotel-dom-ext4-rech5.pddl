(define (domain hotel-ext4-rech5)
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

        ;; ===========================
        ;; Extensión 4: contar habitaciones distintas usadas.
        ;; Solo incrementa si la habitación no estaba marcada.
        ;; Incremento constante (10) para darle más peso que al desperdicio
        ;; pero menos que a rechazar reservas.
        ;; ===========================
        (forall (?h - habitacion)
          (when (and (habitacion-elegida ?r ?h)
                     (not (habitacion-asignada ?h)))
            (and
              (habitacion-asignada ?h)
              (increase (habitaciones-asignadas) 10)
            )
          )
        )

        ;; ===========================
        ;; Extensión 3: pérdidas por plazas libres.
        ;; capacidad = tamaño + 1 -> pérdida1 += 1
        ;; capacidad = tamaño + 2 -> pérdida2 += 2
        ;; capacidad = tamaño + 3 -> pérdida3 += 3
        ;; ===========================
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
        ;; Versión experimento 10:
        ;; Rechazar es barato (5) para ver cómo cambia el comportamiento.
        (increase (reservas-rechazadas) 5)
    )
  )
)
