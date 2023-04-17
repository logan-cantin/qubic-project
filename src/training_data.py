import random
from qubic import Qubic


# Sets the seed to 0 for reproducibility
random.seed(0)

def training_data(N = 1000):
    '''Generates N training data points. Returns (X, y), where X is 
    the feature vector and y is the label.'''
    
    def gen_training_data():
        '''Generator that yields data points, generating new games
        when required.'''
        while True:
            states, winner, _ = Qubic.random_game()
            for state in states:
                yield (state, winner)

    # Generate the data points
    t = gen_training_data()
    d = [next(t) for _ in range(N)]
    return zip(*d)


def to_categorical(ys):
    '''Converts the output to categorical, for training purposes. '''
    return [[0, 1] if y == 1 else [1, 0] for y in ys]