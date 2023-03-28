
# QUBIC

Welcome to my final project for CISC 352 - Artificial Intelligence. I will be using three AI techniques to solve a 3D variant of the game Tic Tac Toe. 

## Techniques
The three techniques are CSPs, Planning, and Deep Learning.

### CSP (Constraint Satisfaction Problem)
In this technique, we model the board using variables and constraints. It takes a current board state as input, and uses a CSP solver to find all moves that prevent the opponent from winning. If there are multiple such moves, it optimizes by selecting the move that sets the current player up the best for a win. If there are no moves that prevent the opponent from winning, the CSP will select one of the moves that blocks a potential win.

### Planning
In this technique, we use a Planner to pick the best moves. The board is modeled in PDDL, and a fully observable, non-deterministic (FOND) planner is used to simulate the opponent.

### Deep learning
Deep reinforcement learning is used for the last technique.

## Usage

### Planning
To run the planner, you first need to install a suitable planner. The online planner-as-a-service, planning.domains, is not suitable for this task, as it times out. You can find instructions for downloading planutils (a python library for managing different planners) [here](https://pypi.org/project/planutils/). I used the LAMA planner.

Run the planner with `planutils run lama domain.pddl problem.pddl`. It took my computer about 20s to solve the problem. The solution will be saved to a file, `sas_plan.1`.
