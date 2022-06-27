import joblib
import numpy


def get_new_rate(input_array):
    predictor = joblib.load('heimdall_predictor.md5')
    new_rate = predictor.predict(input_array)
    return new_rate[0]