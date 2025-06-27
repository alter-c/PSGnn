(define (problem subway)

    (:domain city-subway)

    (:objects 
        passenger0 - passenger

		Line_S1 - line

		PingGuoYuan - station
		JinAn_Qiao - station
		si_dao_qiao - station
		qiao_hu_ying - station
    )
    
    (:init
        (at passenger0 PingGuoYuan)
		(connected PingGuoYuan JinAn_Qiao Line_S1)
		(connected JinAn_Qiao si_dao_qiao Line_S1)
		(connected si_dao_qiao qiao_hu_ying Line_S1)

    )

    (:goal (and
        (at passenger0 qiao_hu_ying)
        )
    )
)