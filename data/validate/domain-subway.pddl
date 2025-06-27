(define (domain city-subway)

    (:requirements :adl :typing)

    (:types 
        line region subway - object
        station - region
        passenger - object
    )

    (:predicates 
        ;; 线路l中车站s1与s2直接相邻
        (connected ?s1 - station ?s2 - station ?l - line)

        ;; 乘客p在区域r中
        (at ?p - passenger ?r - region)

        ;; 乘客p在地铁上
        (on-subway ?p - passenger)
    )

    (:action move
        :parameters (?p - passenger ?from - station ?to - station ?l - line)
        :precondition (and 
            (at ?p ?from)
            (on-subway ?p)
            (or 
                (connected ?from ?to ?l) 
                (connected ?to ?from ?l)
            )
        )
        :effect (and 
            (at ?p ?to)
        )
    )

    (:action enter
        :parameters (?p - passenger ?s - station)
        :precondition (and 
            (at ?p ?s)
        )
        :effect (and 
            (on-subway ?p)
        )
    )

    (:action exit
        :parameters (?p - passenger ?s - station)
        :precondition (and 
            (at ?p ?s)
        )
        :effect (and 
            (not (on-subway ?p))
        )
    )
)