(define (problem ttt)
  (:domain BasicTicTacToe)

  (:objects
  )

  (:init

    (not(won mark-x))
    (not(won mark-o))
    (x-turn)
    (cell-mark cell00 mark-empty)
    (cell-mark cell01 mark-empty)
    (cell-mark cell02 mark-empty)
    (cell-mark cell10 mark-empty)
    (cell-mark cell11 mark-empty)
    (cell-mark cell12 mark-empty)
    (cell-mark cell20 mark-empty)
    (cell-mark cell21 mark-empty)
    (cell-mark cell22 mark-empty)
  )
  (:goal
    (and
      (won mark-x)
      (not(won mark-o))
    )
  )
)
