
from tensorflow import keras
from keras.models import Sequential
from keras.layers import Dense, Flatten, Dropout
from tensorflow import convert_to_tensor
from training_data import training_data, to_categorical



# Generate test, train, validation data
X_train, y_train = training_data(250000)
X_train = convert_to_tensor(X_train)
y_train = convert_to_tensor(to_categorical(y_train))

X_test, y_test = training_data(25000)
X_test = convert_to_tensor(X_test)
y_test = convert_to_tensor(to_categorical(y_test))

X_valid, y_valid = training_data(10000)
X_valid = convert_to_tensor(X_valid)
y_valid = convert_to_tensor(to_categorical(y_valid))


# Load model if possible, otherwise train a new one
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

    # Compile and train the model
    model.compile(loss="categorical_crossentropy",
                optimizer="adam",
                metrics=["accuracy"])
    history = model.fit(X_train, y_train, epochs=100, validation_data=(X_test, y_test))


def infer(X):
    '''Does inference on hyperboards. Returns the probabilities of players 
    X and O winning.'''
    return model.predict(X)
