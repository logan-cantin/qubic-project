(define (problem ttt)
  (:domain TicTacToe)

  (:objects
  )

  (:init
    
    (x-turn)
    (cell-mark cell000 mark-empty)
    (cell-mark cell001 mark-empty)
    (cell-mark cell002 mark-empty)
    (cell-mark cell010 mark-empty)
    (cell-mark cell011 mark-empty)
    (cell-mark cell012 mark-empty)
    (cell-mark cell020 mark-empty)
    (cell-mark cell021 mark-empty)
    (cell-mark cell022 mark-empty)
    (cell-mark cell100 mark-empty)
    (cell-mark cell101 mark-empty)
    (cell-mark cell102 mark-empty)
    (cell-mark cell110 mark-empty)
    (cell-mark cell111 mark-empty)
    (cell-mark cell112 mark-empty)
    (cell-mark cell120 mark-empty)
    (cell-mark cell121 mark-empty)
    (cell-mark cell122 mark-empty)
    (cell-mark cell200 mark-empty)
    (cell-mark cell201 mark-empty)
    (cell-mark cell202 mark-empty)
    (cell-mark cell210 mark-empty)
    (cell-mark cell211 mark-empty)
    (cell-mark cell212 mark-empty)
    (cell-mark cell220 mark-empty)
    (cell-mark cell221 mark-empty)
    (cell-mark cell222 mark-empty)

  )
  (:goal
    (and
      (won mark-x)
      (not(won mark-o))
    )
  )
)
