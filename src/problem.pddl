(define (problem MOVING-TRAILER-HOME)
  (:domain MOVINGCOMPANY)
  (:objects
    trailer casa - destino
    pq_ropa pq_mesa - pqt_chico
    pq_tv pq_mueble - pqt_grande
    mn_izq - mn_izquierda
    mn_der - mn_derecha
  )
  (:init
    (posicion trailer)
    (mano_iz_libre mn_izq)
    (mano_dr_libre mn_der)
    (obj_en-chico pq_ropa trailer)
    (obj_en-chico pq_mesa trailer)
    (obj_en-grande pq_tv trailer)
    (obj_en-grande pq_mueble trailer)
  )
  (:goal
    (and (obj_en-chico pq_ropa casa)
      (obj_en-chico pq_mesa casa)
      (obj_en-grande pq_tv casa)
      (obj_en-grande pq_mueble casa))
  )
)