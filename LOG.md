# Log
This log contains notes about the work for posterity. It was started late (some work has already been done).

## Mar 28
Yesterday, I modeled the problem in PDDL. I was running into all sorts of errors with the planner, mostly about it running out of memory, when I tried to do the full model.
Today, I installed a local planner and tried to run it. My plan took 57GB of RAM(!!!) and it didn't even solve yet. I think the reason is that my goal is so large: I am going to try to use conditional effects to model a "win" fluent.
Planner was playing more moves than it took to win, so I had to add a precondition that the game was not won before a move can be made.
Planner is playing more moves than required because I think that the planner doesn't register the conditional effects until a round later. I will add a "check" action.
New "check" action successfully solved the problem. It took about 20 seconds to get a solution. Didn't required 57GB xD.

Talked to professor Muise: was able to get FOND working. Now, having issues with conditional effects being selected, but they correspond to a position that has already been selected.
Got around this issue by having a "dead end" fluent that corresponds to when the opponent places their piece on an square that is already taken. This shouldn't happen in real life, so this dead end mechanism shouldn't cause any issues.