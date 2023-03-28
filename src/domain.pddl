(define (domain TicTacToe)

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
        cell000 cell001 cell002 cell010 cell011 cell012 cell020 cell021 cell022 cell100 cell101 cell102 cell110 cell111 cell112 cell120 cell121 cell122 cell200 cell201 cell202 cell210 cell211 cell212 cell220 cell221 cell222 - cell
    )

    ; You may introduce whatever predicates you would like to use
    (:predicates
    
        ; Mark a cell
        (cell-mark ?cell - cell ?mark - mark)

        ; X turn
        (x-turn)

        ; Win
        (won ?winner - mark)
    )

    ; Play an x
    (:action play-x

        :parameters (?c - cell)

        :precondition (and
            (cell-mark ?c mark-empty)
            (x-turn)
        )

        :effect (and
            (not(cell-mark ?c mark-empty))
            (cell-mark ?c mark-x)
            (not(x-turn))
            (when (and (cell-mark cell000 mark-x)(cell-mark cell001 mark-x)(cell-mark cell002 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell000 mark-x)(cell-mark cell010 mark-x)(cell-mark cell020 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell000 mark-x)(cell-mark cell100 mark-x)(cell-mark cell200 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell000 mark-x)(cell-mark cell011 mark-x)(cell-mark cell022 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell002 mark-x)(cell-mark cell011 mark-x)(cell-mark cell020 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell000 mark-x)(cell-mark cell110 mark-x)(cell-mark cell220 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell200 mark-x)(cell-mark cell110 mark-x)(cell-mark cell020 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell000 mark-x)(cell-mark cell101 mark-x)(cell-mark cell202 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell002 mark-x)(cell-mark cell101 mark-x)(cell-mark cell200 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell000 mark-x)(cell-mark cell111 mark-x)(cell-mark cell222 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell001 mark-x)(cell-mark cell011 mark-x)(cell-mark cell021 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell001 mark-x)(cell-mark cell101 mark-x)(cell-mark cell201 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell001 mark-x)(cell-mark cell111 mark-x)(cell-mark cell221 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell201 mark-x)(cell-mark cell111 mark-x)(cell-mark cell021 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell002 mark-x)(cell-mark cell012 mark-x)(cell-mark cell022 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell002 mark-x)(cell-mark cell102 mark-x)(cell-mark cell202 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell002 mark-x)(cell-mark cell112 mark-x)(cell-mark cell222 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell202 mark-x)(cell-mark cell112 mark-x)(cell-mark cell022 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell002 mark-x)(cell-mark cell111 mark-x)(cell-mark cell220 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell010 mark-x)(cell-mark cell011 mark-x)(cell-mark cell012 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell010 mark-x)(cell-mark cell110 mark-x)(cell-mark cell210 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell010 mark-x)(cell-mark cell111 mark-x)(cell-mark cell212 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell012 mark-x)(cell-mark cell111 mark-x)(cell-mark cell210 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell011 mark-x)(cell-mark cell111 mark-x)(cell-mark cell211 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell011 mark-x)(cell-mark cell111 mark-x)(cell-mark cell211 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell012 mark-x)(cell-mark cell112 mark-x)(cell-mark cell212 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell020 mark-x)(cell-mark cell021 mark-x)(cell-mark cell022 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell020 mark-x)(cell-mark cell120 mark-x)(cell-mark cell220 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell020 mark-x)(cell-mark cell121 mark-x)(cell-mark cell222 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell022 mark-x)(cell-mark cell121 mark-x)(cell-mark cell220 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell020 mark-x)(cell-mark cell111 mark-x)(cell-mark cell202 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell021 mark-x)(cell-mark cell121 mark-x)(cell-mark cell221 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell022 mark-x)(cell-mark cell122 mark-x)(cell-mark cell222 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell100 mark-x)(cell-mark cell101 mark-x)(cell-mark cell102 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell100 mark-x)(cell-mark cell110 mark-x)(cell-mark cell120 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell100 mark-x)(cell-mark cell111 mark-x)(cell-mark cell122 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell102 mark-x)(cell-mark cell111 mark-x)(cell-mark cell120 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell101 mark-x)(cell-mark cell111 mark-x)(cell-mark cell121 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell102 mark-x)(cell-mark cell112 mark-x)(cell-mark cell122 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell110 mark-x)(cell-mark cell111 mark-x)(cell-mark cell112 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell120 mark-x)(cell-mark cell121 mark-x)(cell-mark cell122 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell200 mark-x)(cell-mark cell201 mark-x)(cell-mark cell202 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell200 mark-x)(cell-mark cell210 mark-x)(cell-mark cell220 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell200 mark-x)(cell-mark cell211 mark-x)(cell-mark cell222 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell202 mark-x)(cell-mark cell211 mark-x)(cell-mark cell220 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell201 mark-x)(cell-mark cell211 mark-x)(cell-mark cell221 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell202 mark-x)(cell-mark cell212 mark-x)(cell-mark cell222 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell210 mark-x)(cell-mark cell211 mark-x)(cell-mark cell212 mark-x)) (and(won mark-x)))
            (when (and (cell-mark cell220 mark-x)(cell-mark cell221 mark-x)(cell-mark cell222 mark-x)) (and(won mark-x)))
        )
    )

    (:action play-o

        :parameters (?c - cell)

        :precondition (and
            (cell-mark ?c mark-empty)
            (not(x-turn))
        )

        :effect (and
            (not(cell-mark ?c mark-empty))
            (cell-mark ?c mark-o)
            (x-turn)
            (when (and (cell-mark cell000 mark-o)(cell-mark cell001 mark-o)(cell-mark cell002 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell000 mark-o)(cell-mark cell010 mark-o)(cell-mark cell020 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell000 mark-o)(cell-mark cell100 mark-o)(cell-mark cell200 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell000 mark-o)(cell-mark cell011 mark-o)(cell-mark cell022 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell002 mark-o)(cell-mark cell011 mark-o)(cell-mark cell020 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell000 mark-o)(cell-mark cell110 mark-o)(cell-mark cell220 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell200 mark-o)(cell-mark cell110 mark-o)(cell-mark cell020 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell000 mark-o)(cell-mark cell101 mark-o)(cell-mark cell202 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell002 mark-o)(cell-mark cell101 mark-o)(cell-mark cell200 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell000 mark-o)(cell-mark cell111 mark-o)(cell-mark cell222 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell001 mark-o)(cell-mark cell011 mark-o)(cell-mark cell021 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell001 mark-o)(cell-mark cell101 mark-o)(cell-mark cell201 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell001 mark-o)(cell-mark cell111 mark-o)(cell-mark cell221 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell201 mark-o)(cell-mark cell111 mark-o)(cell-mark cell021 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell002 mark-o)(cell-mark cell012 mark-o)(cell-mark cell022 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell002 mark-o)(cell-mark cell102 mark-o)(cell-mark cell202 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell002 mark-o)(cell-mark cell112 mark-o)(cell-mark cell222 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell202 mark-o)(cell-mark cell112 mark-o)(cell-mark cell022 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell002 mark-o)(cell-mark cell111 mark-o)(cell-mark cell220 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell010 mark-o)(cell-mark cell011 mark-o)(cell-mark cell012 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell010 mark-o)(cell-mark cell110 mark-o)(cell-mark cell210 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell010 mark-o)(cell-mark cell111 mark-o)(cell-mark cell212 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell012 mark-o)(cell-mark cell111 mark-o)(cell-mark cell210 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell011 mark-o)(cell-mark cell111 mark-o)(cell-mark cell211 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell011 mark-o)(cell-mark cell111 mark-o)(cell-mark cell211 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell012 mark-o)(cell-mark cell112 mark-o)(cell-mark cell212 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell020 mark-o)(cell-mark cell021 mark-o)(cell-mark cell022 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell020 mark-o)(cell-mark cell120 mark-o)(cell-mark cell220 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell020 mark-o)(cell-mark cell121 mark-o)(cell-mark cell222 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell022 mark-o)(cell-mark cell121 mark-o)(cell-mark cell220 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell020 mark-o)(cell-mark cell111 mark-o)(cell-mark cell202 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell021 mark-o)(cell-mark cell121 mark-o)(cell-mark cell221 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell022 mark-o)(cell-mark cell122 mark-o)(cell-mark cell222 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell100 mark-o)(cell-mark cell101 mark-o)(cell-mark cell102 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell100 mark-o)(cell-mark cell110 mark-o)(cell-mark cell120 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell100 mark-o)(cell-mark cell111 mark-o)(cell-mark cell122 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell102 mark-o)(cell-mark cell111 mark-o)(cell-mark cell120 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell101 mark-o)(cell-mark cell111 mark-o)(cell-mark cell121 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell102 mark-o)(cell-mark cell112 mark-o)(cell-mark cell122 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell110 mark-o)(cell-mark cell111 mark-o)(cell-mark cell112 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell120 mark-o)(cell-mark cell121 mark-o)(cell-mark cell122 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell200 mark-o)(cell-mark cell201 mark-o)(cell-mark cell202 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell200 mark-o)(cell-mark cell210 mark-o)(cell-mark cell220 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell200 mark-o)(cell-mark cell211 mark-o)(cell-mark cell222 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell202 mark-o)(cell-mark cell211 mark-o)(cell-mark cell220 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell201 mark-o)(cell-mark cell211 mark-o)(cell-mark cell221 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell202 mark-o)(cell-mark cell212 mark-o)(cell-mark cell222 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell210 mark-o)(cell-mark cell211 mark-o)(cell-mark cell212 mark-o)) (and(won mark-o)))
            (when (and (cell-mark cell220 mark-o)(cell-mark cell221 mark-o)(cell-mark cell222 mark-o)) (and(won mark-o)))
        )
    )

)
