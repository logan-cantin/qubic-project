import numpy as np
from ortools.sat.python import cp_model


class Qubic:

    def __init__(self):

        self.hyperboard = np.zeros((3, 3, 3), dtype=int).reshape((3, 3, 3)) #np.random.randint(-1, 2, size=(3, 3, 3))
        self.next_player = 1

    @staticmethod
    def generate_triples():
        triples = list()
        for i in range(27):
            
            # x row
            if i % 3 == 0:
                triples.append([i, i+1, i+2])
            
            # y row
            if (i // 3) % 3 == 0:
                triples.append([i, i+3, i+6])
            
            # z row
            if 0 <= i < 9:
                triples.append([i, i+9, i+18])
            
            # xy diagonal
            if i in {0, 9, 18}:
                triples.extend([[i, i+4, i+8], [i+2, i+4, i+6]])
            
            # yz diagonal
            if i in {0, 1, 2}:
                triples.extend([[i, i+12, i+24], [i+18, i+12, i+6]])
            
            # xz diagonal
            if i in {0, 3, 6}:
                triples.extend([[i, i+10, i+20], [i+2, i+10, i+18]])
            
            # xyz diagonal
            if i in {0, 2, 4, 6}:
                triples.append([i, 13, 26-i])

        return np.array(triples)

    def solved(self):
        triples = Qubic.generate_triples()
        hyperboard_triples_sum = np.sum(self.hyperboard.flat[triples], axis=1)

        return np.any(hyperboard_triples_sum == 3) or np.any(hyperboard_triples_sum == -3)

    def make_move(self, player_id, coords):

        coords = tuple(reversed(coords))

        if not self.hyperboard[coords] == 0:
            raise RuntimeError("bad move")
        if not self.next_player == player_id:
            raise RuntimeError("not your turn!")

        self.next_player *= -1
        self.hyperboard[coords] = player_id

        return self.solved()
    
    def print(self):

        h = self.hyperboard.flat

        # Slice
        for i in range(0, 27, 9):
            
            rows = [
                f' {h[i+j]:2} | {h[i+j+1]:2} | {h[i+j+2]:2} \n'
                for j in range(0, 9, 3)
            ]
            slice = '----+----+----\n'.join(rows)

            print(slice, end='\n')
        
        print(f'Player {self.next_player}\'s turn.')


                

q = Qubic()

