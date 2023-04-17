from model1 import infer as infer_a
from model2 import infer as infer_b
import tensorflow as tf
import numpy as np
from qubic import Qubic
import random




def best_move(board, inference_fct, objective, player_id):
    empty = list(filter(lambda y: board[y] == 0, np.ndindex((3, 3, 3))))
    if len(empty) == 0:
        print("EMPTY")
        print(board)
        return

    X = list()
    for coord in empty:
        candidate = board.copy()
        candidate[coord] = player_id
        X.append(candidate)
    X = tf.convert_to_tensor(X)

    top_move = None
    best_prob = -1
    predictions = inference_fct(X)
    for coord, pred in zip(empty,predictions):
        if objective(pred) > best_prob:
            top_move = coord
            best_prob = objective(pred)
    return top_move



def simulate_game(p1=None, p2=None):
    
    q = Qubic()
    winner = 0
    while winner == 0:
        if q.next_player == 1:
            player = p1
            objective = lambda x: x[1]
        else:
            player = p2
            objective = lambda x: x[0]
        
        # get all empty indices
        empty = list(filter(lambda y: q.hyperboard[y] == 0, np.ndindex((3, 3, 3))))
        if player is None:
            # select random move
            winner = q.make_move(q.next_player, random.choice(empty))
        elif player == -1:
            # ask human
            print(q.hyperboard)
            coords = [int(x) for x in input("What's your move?").split(' ')]
            winner = q.make_move(q.next_player, coords)
        else:
            move = best_move(q.hyperboard, player, objective, q.next_player)
            
            winner = q.make_move(q.next_player, move)
    
    return (q.hyperboard, winner)


