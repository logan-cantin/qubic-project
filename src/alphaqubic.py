from model1 import infer as infer_a
from model2 import infer as infer_b
import tensorflow as tf
import numpy as np
from qubic import Qubic
import random


def best_move(board, inference_fct, objective, player_id):
    '''Generates the best move.
    - board is the hyperboard
    - inference_fct is the function to use to do inference
    - objective is a function which selects which player to optimize for
    - player_id is the id of the player to move
    
    return the coordinates of the best move
    '''

    # Generate all coordinates of empty cells
    empty = list(filter(lambda y: board[y] == 0, np.ndindex((3, 3, 3))))
    if len(empty) == 0:
        print("EMPTY")
        print(board)
        return

    # Generate all potential next moves
    X = list()
    for coord in empty:
        candidate = board.copy()
        candidate[coord] = player_id
        X.append(candidate)
    X = tf.convert_to_tensor(X)

    # Generate predictions for all possible moves, and return best one
    top_move = None
    best_prob = -1
    predictions = inference_fct(X)
    for coord, pred in zip(empty,predictions):
        if objective(pred) > best_prob:
            top_move = coord
            best_prob = objective(pred)
    return top_move



def simulate_game(p1=None, p2=None):
    '''Simulates a game.
    
    p1 and p2 represent player 1 and 2 respectively.
    if either is None, then it will make random moves
    if either is -1, it will ask the human to make a move
    otherwise, it will assume that it is an inference function
    
    returns the hyperboard of the finished game and the winner'''

    q = Qubic()
    winner = 0
    while winner == 0:

        # Set the player and objective function
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
            # do inference
            move = best_move(q.hyperboard, player, objective, q.next_player)
            winner = q.make_move(q.next_player, move)
    
    return (q.hyperboard, winner)

if __name__ == '__main__':
    # This is how you do an experiment
    print(f"Random vs Random, P1 win rate: {[simulate_game()[1] for _ in range(1000)].count(1)/1000}")
    print(f"Model 1 vs random, P1 win rate: {[simulate_game(p1=infer_a)[1] for _ in range(1000)].count(1)/1000}")
    print(f"random vs model 1, P2 win rate: {[simulate_game(p2=infer_a)[1] for _ in range(1000)].count(-1)/1000}")