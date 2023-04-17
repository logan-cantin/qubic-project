import tensorflow as tf
from tensorflow import keras
from model1 import training_data, to_categorical
from tensorflow import convert_to_tensor
import numpy as np
from keras.models import Sequential
from keras.layers import Dense

# Load the tic tac toe model
model1 = keras.models.load_model('tictactoemodel')

def hyperboard_to_slices(hyperboard):
    '''Converts hyperboards to a list of slices. '''
    slices = []
    for i in range(3):
        slices.append(hyperboard[i,:,:])
        slices.append(hyperboard[:,i,:])
        slices.append(hyperboard[:,:,i])
    slices.append(np.diagonal(hyperboard, axis1=1, axis2=2))
    slices.append(np.diagonal(np.flip(hyperboard, axis=2), axis1=1, axis2=2))
    
    # mod by 2 to accommodate for the tic tac toe model's weird labelling
    return np.mod(np.asarray(slices).reshape((-1, 9)), 3)

def hyperboard_to_softmax(hyperboard):
    '''Converts hyperboard to softmax probabilities based on the slices.
    Preprocessing for model2. '''
    slices = hyperboard_to_slices(hyperboard)
    result = model1.predict(slices)
    return result.flatten()


# Load model, or train it if the model can't be found
try:
    model2 = keras.models.load_model('model2.5.tf1')
except Exception as e:
    print("ERROR loading!")
    if input("Want to train a new one? (y/n)") != 'y':
        quit()

    # Generate the train, test, validation data
    X_train, y_train = training_data(2500)
    X_train = convert_to_tensor(
        [hyperboard_to_softmax(x) for x in X_train])
    y_train = convert_to_tensor(to_categorical(y_train))

    X_test, y_test = training_data(250)
    X_test = convert_to_tensor(
        [hyperboard_to_softmax(x) for x in X_test])
    y_test = convert_to_tensor(to_categorical(y_test))

    X_valid, y_valid = training_data(250)
    X_valid = convert_to_tensor(
        [hyperboard_to_softmax(x) for x in X_valid])
    y_valid = convert_to_tensor(to_categorical(y_valid))

    # Define the model
    model2 = Sequential()
    model2.add(Dense(50, input_shape=(33,), activation='relu'))
    model2.add(Dense(25, activation='relu'))
    model2.add(Dense(2, activation='softmax'))

    # Compile and train the model
    model2.compile(loss="categorical_crossentropy",
                optimizer="adam",
                metrics=["accuracy"])
    history = model2.fit(X_train, y_train, epochs=100, validation_data=(X_test, y_test))


def infer(hyperboards):
    '''Does inference on hyperboards. Returns the probabilities of players 
    X and O winning.'''
    inferences = list()
    for hyperboard in hyperboards:
        slices = hyperboard_to_slices(hyperboard)
        softmax = model1.predict(slices).flatten() 
        inferences.append(model2.predict(convert_to_tensor([softmax]))[0])
    return inferences
    
