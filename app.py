from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import joblib
import numpy as np

# Load the saved model
model_path = "final_model.pkl"
try:
    model = joblib.load(model_path)
    print(f"Model loaded successfully from {model_path}")
except FileNotFoundError:
    print(f"Error: Model file {model_path} not found. Ensure the model is saved in the same directory.")
    raise

# Initialize FastAPI app
app = FastAPI()

# Define input data schema
class InputData(BaseModel):
    feature1: float
    feature2: float
    feature3: float
    feature4: float

# Define prediction endpoint
@app.post("/predict/")
async def predict(data: InputData):
    try:
        # Prepare input for prediction
        input_array = np.array([[data.feature1, data.feature2, data.feature3, data.feature4]])
        
        # Perform prediction
        prediction = model.predict(input_array)
        probability = model.predict_proba(input_array).max()
        
        return {
            "prediction": int(prediction[0]),
            "probability": float(probability)
        }
    except Exception as e:
        raise HTTPException(status_code=400, detail=f"Prediction error: {str(e)}")

# Define a health check endpoint
@app.get("/")
async def root():
    return {"message": "The FastAPI model prediction service is running successfully!"}
