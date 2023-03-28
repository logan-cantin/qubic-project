(define (domain BasicTicTacToe)

    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
        :disjunctive-preconditions
        :non-deterministic
        :strips
    )

    ; Do not modify the types
    (:types
        cell mark
    )

    ; Do not modify the constants
    (:constants
        mark-x mark-o mark-empty - mark
        cell00 cell01 cell02 cell10 cell11 cell12 cell20 cell21 cell22 - cell
    )

    ; You may introduce whatever predicates you would like to use
    (:predicates
    
        ; Mark a cell
        (cell-mark ?cell - cell ?mark - mark)

        ; X turn
        (x-turn)

        ; Win
        (won ?winner - mark)

        (check-required)

        (dead-end)
    )

    ; Check to see if anyone has won
    (:action check
        :precondition (and 
            (check-required)
        )

        :effect (and 
            (when (and (cell-mark cell00 mark-x)(cell-mark cell01 mark-x)(cell-mark cell02 mark-x)) (won mark-x))
            (when (and (cell-mark cell10 mark-x)(cell-mark cell11 mark-x)(cell-mark cell12 mark-x)) (won mark-x))
            (when (and (cell-mark cell20 mark-x)(cell-mark cell21 mark-x)(cell-mark cell22 mark-x)) (won mark-x))
            (when (and (cell-mark cell00 mark-x)(cell-mark cell10 mark-x)(cell-mark cell20 mark-x)) (won mark-x))
            (when (and (cell-mark cell01 mark-x)(cell-mark cell11 mark-x)(cell-mark cell21 mark-x)) (won mark-x))
            (when (and (cell-mark cell02 mark-x)(cell-mark cell12 mark-x)(cell-mark cell22 mark-x)) (won mark-x))
            (when (and (cell-mark cell00 mark-x)(cell-mark cell11 mark-x)(cell-mark cell22 mark-x)) (won mark-x))
            (when (and (cell-mark cell02 mark-x)(cell-mark cell11 mark-x)(cell-mark cell20 mark-x)) (won mark-x))
            (when (and (cell-mark cell00 mark-o)(cell-mark cell01 mark-o)(cell-mark cell02 mark-o)) (won mark-o))
            (when (and (cell-mark cell10 mark-o)(cell-mark cell11 mark-o)(cell-mark cell12 mark-o)) (won mark-o))
            (when (and (cell-mark cell20 mark-o)(cell-mark cell21 mark-o)(cell-mark cell22 mark-o)) (won mark-o))
            (when (and (cell-mark cell00 mark-o)(cell-mark cell10 mark-o)(cell-mark cell20 mark-o)) (won mark-o))
            (when (and (cell-mark cell01 mark-o)(cell-mark cell11 mark-o)(cell-mark cell21 mark-o)) (won mark-o))
            (when (and (cell-mark cell02 mark-o)(cell-mark cell12 mark-o)(cell-mark cell22 mark-o)) (won mark-o))
            (when (and (cell-mark cell00 mark-o)(cell-mark cell11 mark-o)(cell-mark cell22 mark-o)) (won mark-o))
            (when (and (cell-mark cell02 mark-o)(cell-mark cell11 mark-o)(cell-mark cell20 mark-o)) (won mark-o))
            (not(check-required))
        )
    )

    ; Play an x
    (:action play-x

        :parameters (?c - cell)

        :precondition (and
            (not(won mark-x))
            (not(won mark-o))
            (cell-mark ?c mark-empty)
            (x-turn)
            (not(check-required))
        )

        :effect (and
            (not(cell-mark ?c mark-empty))
            (cell-mark ?c mark-x)
            (not(x-turn))
            (check-required)
        )
    )

    (:action play-o

        :precondition (and
            (not(won mark-x))
            (not(won mark-o))
            (not(x-turn))
            (not(check-required))
        )

        :effect (and
            (x-turn)
            (check-required)
            (oneof
                
                ;(and (cell-mark cell21 mark-o) (not(cell-mark cell21 mark-empty)))
                ;(and (cell-mark cell20 mark-o) (not(cell-mark cell20 mark-empty)))
                ;(cell-mark cell02 mark-o)
                ;(cell-mark cell10 mark-o)
                ;(cell-mark cell11 mark-o)
                ;(cell-mark cell12 mark-o)
                ;(cell-mark cell20 mark-o)
                ;(cell-mark cell21 mark-o)
                ;(cell-mark cell22 mark-o)


                (and (when (cell-mark cell00 mark-empty) (and (not(cell-mark cell00 mark-empty)) (cell-mark cell00 mark-o))) (when (not(cell-mark cell00 mark-empty)) (dead-end)))

                (and (when (cell-mark cell00 mark-empty) (and (not (cell-mark cell00 mark-empty)) (cell-mark cell00 mark-o))) (when (not(cell-mark cell00 mark-empty)) (dead-end))) (and (when (cell-mark cell01 mark-empty) (and (not (cell-mark cell01 mark-empty)) (cell-mark cell01 mark-o))) (when (not(cell-mark cell01 mark-empty)) (dead-end))) (and (when (cell-mark cell02 mark-empty) (and (not (cell-mark cell02 mark-empty)) (cell-mark cell02 mark-o))) (when (not(cell-mark cell02 mark-empty)) (dead-end))) (and (when (cell-mark cell10 mark-empty) (and (not (cell-mark cell10 mark-empty)) (cell-mark cell10 mark-o))) (when (not(cell-mark cell10 mark-empty)) (dead-end))) (and (when (cell-mark cell11 mark-empty) (and (not (cell-mark cell11 mark-empty)) (cell-mark cell11 mark-o))) (when (not(cell-mark cell11 mark-empty)) (dead-end))) (and (when (cell-mark cell12 mark-empty) (and (not (cell-mark cell12 mark-empty)) (cell-mark cell12 mark-o))) (when (not(cell-mark cell12 mark-empty)) (dead-end))) (and (when (cell-mark cell20 mark-empty) (and (not (cell-mark cell20 mark-empty)) (cell-mark cell20 mark-o))) (when (not(cell-mark cell20 mark-empty)) (dead-end))) (and (when (cell-mark cell21 mark-empty) (and (not (cell-mark cell21 mark-empty)) (cell-mark cell21 mark-o))) (when (not(cell-mark cell21 mark-empty)) (dead-end))) (and (when (cell-mark cell22 mark-empty) (and (not (cell-mark cell22 mark-empty)) (cell-mark cell22 mark-o))) (when (not(cell-mark cell22 mark-empty)) (dead-end)))

                ; (when (cell-mark cell00 mark-empty) (and (not(cell-mark cell00 mark-empty)) (cell-mark cell00 mark-o)))
                ; (when (cell-mark cell01 mark-empty) (and (not(cell-mark cell01 mark-empty)) (cell-mark cell01 mark-o)))
                ; (when (cell-mark cell02 mark-empty) (and (not(cell-mark cell02 mark-empty)) (cell-mark cell02 mark-o)))
                ; (when (cell-mark cell10 mark-empty) (and (not(cell-mark cell10 mark-empty)) (cell-mark cell10 mark-o)))
                ; (when (cell-mark cell11 mark-empty) (and (not(cell-mark cell11 mark-empty)) (cell-mark cell11 mark-o)))
                ; (when (cell-mark cell12 mark-empty) (and (not(cell-mark cell12 mark-empty)) (cell-mark cell12 mark-o)))
                ; (when (cell-mark cell20 mark-empty) (and (not(cell-mark cell20 mark-empty)) (cell-mark cell20 mark-o)))
                ; (when (cell-mark cell21 mark-empty) (and (not(cell-mark cell21 mark-empty)) (cell-mark cell21 mark-o)))
                ; (when (cell-mark cell22 mark-empty) (and (not(cell-mark cell22 mark-empty)) (cell-mark cell22 mark-o)))
            )
        )
    )

)
