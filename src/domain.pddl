(define (domain MOVINGCOMPANY)
	(:requirements :strips :typing)
	(:types
		destino manos
		pqt_chico pqt_grande - paquete
		mn_izquierda mn_derecha - manos
	)
	(:predicates
		(posicion ?r - destino)
		(obj_en-chico ?b - pqt_chico ?r - destino)
		(obj_en-grande ?b - pqt_grande ?r - destino)
		(mano_dr_libre ?g - mn_derecha)
		(mano_iz_libre ?g - mn_izquierda)
		(llevar-pq-chico-de ?o - pqt_chico ?g - mn_derecha)
		(llevar-pq-chico-iz ?o - pqt_chico ?g - mn_izquierda)
		(llevar-pq-grande ?o - pqt_grande ?md - mn_derecha ?mi - mn_izquierda)
	)

	(:action mover
		:parameters (?from ?to - destino)
		:precondition (posicion ?from)
		:effect (and 
			(posicion ?to)
			(not (posicion ?from))
		)
	)

	(:action levantar-pq-grande
		:parameters (?paquete - pqt_grande ?aux_destino - destino ?aux_mn_derecha - mn_derecha ?aux_mn_izquierda - mn_izquierda)
		:precondition (and 
				(obj_en-grande ?paquete ?aux_destino) 
				(posicion ?aux_destino) 
				(mano_dr_libre ?aux_mn_derecha) 
				(mano_iz_libre ?aux_mn_izquierda)
		)
		:effect (and (llevar-pq-grande ?paquete ?aux_mn_derecha ?aux_mn_izquierda)
			(not (obj_en-grande ?paquete ?aux_destino))
			(not (mano_dr_libre ?aux_mn_derecha))
			(not (mano_iz_libre ?aux_mn_izquierda))
		)
	)

	(:action levantar-pq-chico-iz
		:parameters (?aux_paquete - pqt_chico ?aux_destino - destino ?mano - mn_izquierda)
		:precondition (and 
			(obj_en-chico ?aux_paquete ?aux_destino) 
			(posicion ?aux_destino) 
			(mano_iz_libre ?mano)
		)
		:effect (and (llevar-pq-chico-iz ?aux_paquete ?mano)
			(not (obj_en-chico ?aux_paquete ?aux_destino))
			(not (mano_iz_libre ?mano)))
	)

	(:action levantar-pq-chico-de
		:parameters (?aux_paquete - pqt_chico ?aux_destino - destino ?mano - mn_derecha)
		:precondition (and 
			(obj_en-chico ?aux_paquete ?aux_destino) 
			(posicion ?aux_destino) 
			(mano_dr_libre ?mano)
		)
		:effect (and (llevar-pq-chico-de ?aux_paquete ?mano)
			(not (obj_en-chico ?aux_paquete ?aux_destino))
			(not (mano_dr_libre ?mano)))
	)

	(:action bajar-grande
		:parameters (?paquete - pqt_grande ?aux_destino - destino ?aux_mn_derecha - mn_derecha ?aux_mn_izquierda - mn_izquierda)
		:precondition (and (llevar-pq-grande ?paquete ?aux_mn_derecha ?aux_mn_izquierda) (posicion ?aux_destino))
		:effect (and (obj_en-grande ?paquete ?aux_destino)
			(mano_dr_libre ?aux_mn_derecha)
			(mano_iz_libre ?aux_mn_izquierda)
			(not (llevar-pq-grande ?paquete ?aux_mn_derecha ?aux_mn_izquierda)))
	)

	(:action bajar-chico-iz
		:parameters (?paquete - pqt_chico ?aux_destino - destino ?mano - mn_izquierda)
		:precondition (and (llevar-pq-chico-iz ?paquete ?mano) (posicion ?aux_destino))
		:effect (and (obj_en-chico ?paquete ?aux_destino)
			(mano_iz_libre ?mano)
			(not (llevar-pq-chico-iz ?paquete ?mano)))
	)

	(:action bajar-chico-de
		:parameters (?aux_paquete - pqt_chico ?aux_destino - destino ?manos - mn_derecha)
		:precondition (and (llevar-pq-chico-de ?aux_paquete ?manos) (posicion ?aux_destino))
		:effect (and (obj_en-chico ?aux_paquete ?aux_destino)
			(mano_dr_libre ?manos)
			(not (llevar-pq-chico-de ?aux_paquete ?manos)))
	)
)