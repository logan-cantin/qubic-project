import time
from ortools.sat.python import cp_model
import numpy as np
import itertools

from qubic import Qubic

class QubicSolver():

    def __init__(self, player_id):

        # Initialize the object
        self.player_id = player_id
        

    def solve(self, q):

        # Create model
        model = cp_model.CpModel()
        hyperboard = np.array(q.hyperboard.flat)

        # Create the variables
        cubes = np.array([
            model.NewIntVar(-1, 1, f'Cube({i % 3},{(i % 9) // 3},{i // 9})') for i in range(27)
        ])
        empty = list()

        # Add constraints for tiles that have already been placed
        for var, val in zip(cubes, hyperboard):
            if val != 0:
                model.Add(var == val)
            else:
                empty.append(var)

        # Must attempt to prevent opponent from winning
        for triple in Qubic.generate_triples():
            model.Add(np.sum(cubes[triple]) < 2)
        
        # Must place exactly one piece
        exactly_one = [
            i*(0,) + (-1,) + (len(empty) - i - 1)*(0,)
            for i in range(len(empty)) 
        ]
        model.AddAllowedAssignments(
            empty, exactly_one
        )

        solver = cp_model.CpSolver()
        status = solver.Solve(model)

        if status == cp_model.OPTIMAL or status == cp_model.FEASIBLE:
            for var in empty:
                if solver.Value(var) != 0:
                    print(var, solver.Value(var))
        else:
            print('loss')
                    

q = Qubic()
opponent = QubicSolver(1)

while not q.solved():
    
    # player
    if q.next_player == 1:
        q.print()
        coords = tuple(int(x) for x in input("What's your move? ").split(' '))
        q.make_move(1, coords)
    else:
        opponent.solve(q)
        coords = tuple(int(x) for x in input("Coords:").split())
        q.make_move(-1, coords)




'''
        # Create constraints:
        # For each row / column, 
        for i in range(3):
            model.AddAllowedAssignments(
                squares[i], (1, 1, 1))
            model.AddAllowedAssignments(
                [squares[j][i] for j in range(3)], (1, 1, 1))
        for i in [0, 2]:
            model.AddAllowedAssignments(
                [squares[i][2-i], squares[1][1], squares[2-i][i]], (1, 1, 1)
            )

    class TTTSolutionPrinter(cp_model.CpSolverSolutionCallback):
        """Print intermediate solutions."""

        def __init__(self, squares):
            cp_model.CpSolverSolutionCallback.__init__(self)
            self.__squares = squares
            self.__solution_count = 0
            self.__start_time = time.time()

        def solution_count(self):
            return self.__solution_count

        def on_solution_callback(self):
            current_time = time.time()
            print('Solution %i, time = %f s' %
                (self.__solution_count, current_time - self.__start_time))
            self.__solution_count += 1

            for x in range(3):
                for y in range(3):
                    if squares[x][y]


    solver = cp_model.CpSolver()
    solution_printer = TTTSolutionPrinter(squares)
'''