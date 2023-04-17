import tensorflow as tf
from tensorflow import keras
from model1 import training_data, to_categorical
from tensorflow import convert_to_tensor
import numpy as np
from keras.models import Sequential
from keras.layers import Dense

model1 = keras.models.load_model('tictactoemodel')


def hyperboard_to_slices(hyperboard):
    slices = []
    for i in range(3):
        slices.append(hyperboard[i,:,:])
        slices.append(hyperboard[:,i,:])
        slices.append(hyperboard[:,:,i])
    slices.append(np.diagonal(hyperboard, axis1=1, axis2=2))
    slices.append(np.diagonal(np.flip(hyperboard, axis=2), axis1=1, axis2=2))
    
    return np.mod(np.asarray(slices).reshape((-1, 9)), 3)

def hyperboard_to_softmax(hyperboard):
    slices = hyperboard_to_slices(hyperboard)
    result = model1.predict(slices)
    return result.flatten()


try:
    model2 = keras.models.load_model('model2.5.tf1')
except Exception as e:
    print("ERROR loading!")
    if input("Want to train a new one? (y/n)") != 'y':
        quit()

    X_train, y_train = training_data(2500)
    X_test, y_test = training_data(250)
    y_train = convert_to_tensor(to_categorical(y_train))
    y_test = convert_to_tensor(to_categorical(y_test))

    X_train, X_test = convert_to_tensor([hyperboard_to_softmax(x) for x in X_train]), convert_to_tensor([hyperboard_to_softmax(x) for x in X_test])

    X_valid, y_valid = training_data(250)
    X_valid = convert_to_tensor([hyperboard_to_softmax(x) for x in X_valid])
    y_valid = convert_to_tensor(to_categorical(y_valid))




    # Define the model
    model2 = Sequential()
    model2.add(Dense(50, input_shape=(33,), activation='relu'))
    model2.add(Dense(25, activation='relu'))
    model2.add(Dense(2, activation='softmax'))

    model2.compile(loss="categorical_crossentropy",
                optimizer="adam",
                metrics=["accuracy"])

    history = model2.fit(X_train, y_train, epochs=100, validation_data=(X_test, y_test))

    model2.evaluate(X_valid, y_valid)

def infer(hyperboards):
    inferences = list()
    for hyperboard in hyperboards:
        slices = hyperboard_to_slices(hyperboard)
        softmax = model1.predict(slices).flatten() 
        inferences.append(model2.predict(convert_to_tensor([softmax]))[0])
    return inferences
    
