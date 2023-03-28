(define (domain BasicTicTacToe)

    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
        :disjunctive-preconditions
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

        :parameters (?c - cell)

        :precondition (and
            (not(won mark-x))
            (not(won mark-o))
            (cell-mark ?c mark-empty)
            (not(x-turn))
            (not(check-required))
        )

        :effect (and
            (not(cell-mark ?c mark-empty))
            (cell-mark ?c mark-o)
            (x-turn)
            (check-required)
        )
    )

)
