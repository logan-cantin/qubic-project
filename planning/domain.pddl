
(define (domain TicTacToe)

    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
        :disjunctive-preconditions
    )

    (:types
        cell mark
    )

    (:constants
        mark-x mark-o mark-empty - mark
        cell000 cell001 cell002 cell010 cell011 cell012 cell020 cell021 cell022 cell100 cell101 cell102 cell110 cell111 cell112 cell120 cell121 cell122 cell200 cell201 cell202 cell210 cell211 cell212 cell220 cell221 cell222 - cell
    )

    (:predicates
    
        ; Mark a cell
        (cell-mark ?cell - cell ?mark - mark)

        ; X's turn
        (x-turn)

        ; If a player has won
        (won ?winner - mark)

        ; Whether a board check is required
        (check-required)

        ; prevents the opponent from playing over a cell that has already been marked
        (dead-end)
    )


    ; Play an x on the board
    (:action play-x

        :parameters (?c - cell)

        :precondition (and
            (cell-mark ?c mark-empty)
            (x-turn)
            (not(check-required))
            (not(won mark-x))
            (not(won mark-o))
        )

        :effect (and
            (not(cell-mark ?c mark-empty))
            (cell-mark ?c mark-x)
            (not(x-turn))
            (check-required)
        )
    )

    ; Play an o on the board
    (:action play-o

        :precondition (and
            (not(x-turn))
            (not(check-required))
            (not(won mark-x))
            (not(won mark-o))
        )

        :effect (and
            (x-turn)
            (check-required)
            (oneof
            
                (and (when (cell-mark cell000 mark-empty) (and (not (cell-mark cell000 mark-empty)) (cell-mark cell000 mark-o))) (when (not(cell-mark cell000 mark-empty)) (dead-end)))
                (and (when (cell-mark cell001 mark-empty) (and (not (cell-mark cell001 mark-empty)) (cell-mark cell001 mark-o))) (when (not(cell-mark cell001 mark-empty)) (dead-end)))
                (and (when (cell-mark cell002 mark-empty) (and (not (cell-mark cell002 mark-empty)) (cell-mark cell002 mark-o))) (when (not(cell-mark cell002 mark-empty)) (dead-end)))
                (and (when (cell-mark cell010 mark-empty) (and (not (cell-mark cell010 mark-empty)) (cell-mark cell010 mark-o))) (when (not(cell-mark cell010 mark-empty)) (dead-end)))
                (and (when (cell-mark cell011 mark-empty) (and (not (cell-mark cell011 mark-empty)) (cell-mark cell011 mark-o))) (when (not(cell-mark cell011 mark-empty)) (dead-end)))
                (and (when (cell-mark cell012 mark-empty) (and (not (cell-mark cell012 mark-empty)) (cell-mark cell012 mark-o))) (when (not(cell-mark cell012 mark-empty)) (dead-end)))
                (and (when (cell-mark cell020 mark-empty) (and (not (cell-mark cell020 mark-empty)) (cell-mark cell020 mark-o))) (when (not(cell-mark cell020 mark-empty)) (dead-end)))
                (and (when (cell-mark cell021 mark-empty) (and (not (cell-mark cell021 mark-empty)) (cell-mark cell021 mark-o))) (when (not(cell-mark cell021 mark-empty)) (dead-end)))
                (and (when (cell-mark cell022 mark-empty) (and (not (cell-mark cell022 mark-empty)) (cell-mark cell022 mark-o))) (when (not(cell-mark cell022 mark-empty)) (dead-end)))
                (and (when (cell-mark cell100 mark-empty) (and (not (cell-mark cell100 mark-empty)) (cell-mark cell100 mark-o))) (when (not(cell-mark cell100 mark-empty)) (dead-end)))
                (and (when (cell-mark cell101 mark-empty) (and (not (cell-mark cell101 mark-empty)) (cell-mark cell101 mark-o))) (when (not(cell-mark cell101 mark-empty)) (dead-end)))
                (and (when (cell-mark cell102 mark-empty) (and (not (cell-mark cell102 mark-empty)) (cell-mark cell102 mark-o))) (when (not(cell-mark cell102 mark-empty)) (dead-end)))
                (and (when (cell-mark cell110 mark-empty) (and (not (cell-mark cell110 mark-empty)) (cell-mark cell110 mark-o))) (when (not(cell-mark cell110 mark-empty)) (dead-end)))
                (and (when (cell-mark cell111 mark-empty) (and (not (cell-mark cell111 mark-empty)) (cell-mark cell111 mark-o))) (when (not(cell-mark cell111 mark-empty)) (dead-end)))
                (and (when (cell-mark cell112 mark-empty) (and (not (cell-mark cell112 mark-empty)) (cell-mark cell112 mark-o))) (when (not(cell-mark cell112 mark-empty)) (dead-end)))
                (and (when (cell-mark cell120 mark-empty) (and (not (cell-mark cell120 mark-empty)) (cell-mark cell120 mark-o))) (when (not(cell-mark cell120 mark-empty)) (dead-end)))
                (and (when (cell-mark cell121 mark-empty) (and (not (cell-mark cell121 mark-empty)) (cell-mark cell121 mark-o))) (when (not(cell-mark cell121 mark-empty)) (dead-end)))
                (and (when (cell-mark cell122 mark-empty) (and (not (cell-mark cell122 mark-empty)) (cell-mark cell122 mark-o))) (when (not(cell-mark cell122 mark-empty)) (dead-end)))
                (and (when (cell-mark cell200 mark-empty) (and (not (cell-mark cell200 mark-empty)) (cell-mark cell200 mark-o))) (when (not(cell-mark cell200 mark-empty)) (dead-end)))
                (and (when (cell-mark cell201 mark-empty) (and (not (cell-mark cell201 mark-empty)) (cell-mark cell201 mark-o))) (when (not(cell-mark cell201 mark-empty)) (dead-end)))
                (and (when (cell-mark cell202 mark-empty) (and (not (cell-mark cell202 mark-empty)) (cell-mark cell202 mark-o))) (when (not(cell-mark cell202 mark-empty)) (dead-end)))
                (and (when (cell-mark cell210 mark-empty) (and (not (cell-mark cell210 mark-empty)) (cell-mark cell210 mark-o))) (when (not(cell-mark cell210 mark-empty)) (dead-end)))
                (and (when (cell-mark cell211 mark-empty) (and (not (cell-mark cell211 mark-empty)) (cell-mark cell211 mark-o))) (when (not(cell-mark cell211 mark-empty)) (dead-end)))
                (and (when (cell-mark cell212 mark-empty) (and (not (cell-mark cell212 mark-empty)) (cell-mark cell212 mark-o))) (when (not(cell-mark cell212 mark-empty)) (dead-end)))
                (and (when (cell-mark cell220 mark-empty) (and (not (cell-mark cell220 mark-empty)) (cell-mark cell220 mark-o))) (when (not(cell-mark cell220 mark-empty)) (dead-end)))
                (and (when (cell-mark cell221 mark-empty) (and (not (cell-mark cell221 mark-empty)) (cell-mark cell221 mark-o))) (when (not(cell-mark cell221 mark-empty)) (dead-end)))
                (and (when (cell-mark cell222 mark-empty) (and (not (cell-mark cell222 mark-empty)) (cell-mark cell222 mark-o))) (when (not(cell-mark cell222 mark-empty)) (dead-end)))


            )
        )
    )

    ; Check: checks the board to see if there has been a winner
    (:action check

        :precondition (and 
            (check-required)
        )

        :effect (and
            (not(check-required))
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

)
