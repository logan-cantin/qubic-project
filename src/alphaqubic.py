from qubic import Qubic
from tensorflow import keras
from keras.models import Sequential
from keras.layers import Dense, Flatten, Dropout
import numpy as np
from tensorflow import convert_to_tensor
import random

# training data generator

random.seed(0)

def training_data(N = 1000):
    def gen_training_data():
        while True:
            states, winner, _ = Qubic.random_game()
            for state in states:
                yield (state, winner)

    t = gen_training_data()
    d = [next(t) for _ in range(N)]
    return zip(*d)



def to_categorical(ys):
    return [[0, 1] if y == 1 else [1, 0] for y in ys]


X_train, y_train = training_data(250000)
X_test, y_test = training_data(25000)
y_train = convert_to_tensor(to_categorical(y_train))
y_test = convert_to_tensor(to_categorical(y_test))
X_train, X_test = convert_to_tensor(X_train), convert_to_tensor(X_test)

X_valid, y_valid = training_data(10000)
X_valid = convert_to_tensor(X_valid)
y_valid = convert_to_tensor(to_categorical(y_valid))

try:
    model = keras.models.load_model('model.tf1')
except Exception as e:
    print("NO MODEL: want to train? (y/n)")
    if input() != 'y':
        quit()
    # Define the model
    model = Sequential()
    model.add(Flatten(input_shape=[3,3,3]))
    model.add(Dense(200, input_shape=(27,), activation='relu'))
    model.add(Dropout(0.2))
    model.add(Dense(125, activation='relu'))
    model.add(Dense(75, activation='relu'))
    model.add(Dropout(0.1))
    model.add(Dense(25, activation='relu'))
    model.add(Dense(2, activation='softmax'))

    model.compile(loss="categorical_crossentropy",
                optimizer="adam",
                metrics=["accuracy"])

    history = model.fit(X_train, y_train, epochs=100, validation_data=(X_test, y_test))


def best_move(board, model, objective, player_id):
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
    X = convert_to_tensor(X)

    top_move = None
    best_prob = -1
    predictions = model.predict(X)
    for coord, pred in zip(empty,predictions):
        #print(coord, pred)
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
        elif player is -1:
            # ask human
            print(q.hyperboard)
            coords = [int(x) for x in input("What's your move?").split(' ')]
            winner = q.make_move(q.next_player, coords)
        else:
            move = best_move(q.hyperboard, player, objective, q.next_player)
            
            winner = q.make_move(q.next_player, move)
    
    return (q.hyperboard, winner)


