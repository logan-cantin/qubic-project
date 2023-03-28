import time
from ortools.sat.python import cp_model
import numpy as np
import itertools

from qubic import Qubic

class QubicBaseSolver():

    def __init__(self, player_id):

        # Initialize the object
        self.player_id = player_id
        

    def solve(self, q):

        # Create model
        self.q = q
        self.model = cp_model.CpModel()
        self.hyperboard = np.array(q.hyperboard.flat)

        # Create the variables
        self.cubes = np.array([
            self.model.NewIntVar(-1, 1, f'Cube({i % 3},{(i % 9) // 3},{i // 9})') for i in range(27)
        ])
        self.var_cube_map = {
            self.cubes.reshape((3, 3, 3))[index]: index
            for index in np.ndindex(3, 3, 3)
        }
        self.empty = list()

        # Add constraints for tiles that have already been placed
        for var, val in zip(self.cubes, self.hyperboard):
            if val != 0:
                self.model.Add(var == val)
            else:
                self.empty.append(var)

        # Must place exactly one piece
        exactly_one = [
            i*(0,) + (-1,) + (len(self.empty) - i - 1)*(0,)
            for i in range(len(self.empty)) 
        ]
        self.model.AddAllowedAssignments(
            self.empty, exactly_one
        )
                    

class QubicWinSolver(QubicBaseSolver):

    def solve(self):

        # Try to find a way to get a win
        triples = Qubic.generate_triples()
        self.model.AddAtLeastOne(np.sum(self.cubes[triples], axis=1) == -3)

        solver = cp_model.CpSolver()
        status = solver.Solve(self.model)

        if status == cp_model.OPTIMAL or status == cp_model.FEASIBLE:
            for var in self.empty:
                if solver.Value(var) != 0:
                    print(var, solver.Value(var), self.var_cube_map[var])
        else:
            print('loss')



class QubicPreventionSolver(QubicBaseSolver):

    def solve(self, q):
        super().solve(q)

        # Must attempt to prevent opponent from winning
        for triple in Qubic.generate_triples():
            self.model.Add(np.sum(self.cubes[triple]) < 2)

        solver = cp_model.CpSolver()
        status = solver.Solve(self.model)

        if status == cp_model.OPTIMAL or status == cp_model.FEASIBLE:
            for var in self.empty:
                if solver.Value(var) != 0:
                    return tuple(reversed(self.var_cube_map[var]))
        else:
            print('loss')
            return None


q = Qubic()
opponent = QubicPreventionSolver(-1)

while not q.solved():
    
    # player
    if q.next_player == 1:
        q.print()
        coords = tuple(int(x) for x in input("What's your move? ").split(' '))
        q.make_move(1, coords)
    else:
        move = opponent.solve(q)
        q.make_move(-1, move)

