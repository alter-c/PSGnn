(define (problem subway)

    (:domain city-subway)

    (:objects 
        passenger0 - passenger

		Line_S1 - line

		PingGuoYuan - station
		JinAn_Qiao - station
    )
    
    (:init
        (at passenger0 PingGuoYuan)
		(connected PingGuoYuan JinAn_Qiao Line_S1)

    )

    (:goal (and
        (at passenger0 JinAn_Qiao)
        )
    )
)