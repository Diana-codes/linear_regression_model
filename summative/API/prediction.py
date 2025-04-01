import os
import joblib
import numpy as np
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware
from pydantic import Field

app = FastAPI()

# Enhanced CORS configuration
app.add_middleware(
    CORSMiddleware,
allow_origins=[
    "http://localhost",
    "http://localhost:3000",
    "http://localhost:8080",
    "http://127.0.0.1",
    "http://127.0.0.1:3000",
    "http://127.0.0.1:8080",
    # Add more ports if needed
],
    allow_credentials=True,
    allow_methods=["POST", "OPTIONS"],  # Only necessary methods
    allow_headers=["*"],
    expose_headers=["*"]
)

# Model loading with better error handling
MODEL_PATH = os.path.join(os.path.dirname(__file__), "best_random_forest.pkl")

def load_model():
    """Load and validate the ML model"""
    if not os.path.exists(MODEL_PATH):
        raise FileNotFoundError(f"Model file not found at {MODEL_PATH}")
    
    try:
        model = joblib.load(MODEL_PATH)
        # Test prediction to validate model
        test_input = np.array([[0]*7])  # 7 features
        _ = model.predict(test_input)  # Will raise if model is corrupted
        return model
    except Exception as e:
        raise ValueError(f"Model loading failed: {str(e)}")

# Load model at startup
try:
    model = load_model()
    print("✓ Model loaded successfully")
except Exception as e:
    print(f"✗ Model loading failed: {e}")
    raise

class PredictionInput(BaseModel):
    """Input data validation with descriptions"""
    Rainfall_mm: float = Field(..., example=800.0, description="Rainfall in millimeters")
    Temperature_Celsius: float = Field(..., example=25.0, description="Temperature in Celsius")
    Soil_Type: int = Field(..., example=1, ge=0, le=3, description="0=Sandy, 1=Clay, 2=Loam, 3=Silt")
    Fertilizer_Used: int = Field(..., example=1, ge=0, le=1, description="0=False, 1=True")
    Irrigation_Used: int = Field(..., example=1, ge=0, le=1, description="0=False, 1=True")
    Weather_Condition: int = Field(..., example=2, ge=0, le=2, description="0=Sunny, 1=Rainy, 2=Cloudy")
    Region: int = Field(..., example=0, ge=0, le=3, description="0=North, 1=South, 2=East, 3=West")

@app.post("/predict", response_model=dict)
async def predict(input_data: PredictionInput):
    """Make crop yield predictions"""
    try:
        features = np.array([[
            input_data.Rainfall_mm,
            input_data.Temperature_Celsius,
            input_data.Soil_Type,
            input_data.Fertilizer_Used,
            input_data.Irrigation_Used,
            input_data.Weather_Condition,
            input_data.Region
        ]])
        
        # Validate input shape matches model expectations
        if features.shape[1] != 7:
            raise HTTPException(
                status_code=422,
                detail=f"Expected 7 features, got {features.shape[1]}"
            )
            
        prediction = model.predict(features)
        return {
            "prediction": float(prediction[0]),
            "units": "tons_per_hectare"
        }
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(
            status_code=500,
            detail=f"Prediction failed: {str(e)}"
        )