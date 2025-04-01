# 🌾 Crop Yield Prediction System

📌 **Overview**  
This machine learning system predicts crop yield based on various environmental and agricultural factors. By analyzing relationships between factors like rainfall, temperature, soil type, and more, it provides accurate predictions to help farmers optimize their farming techniques and improve crop productivity.

📌 **Project Overview**  
The system predicts crop yield in tons per hectare using the following parameters:
- Rainfall (mm)
- Temperature (°C)
- Soil Type
- Fertilizer Used
- Irrigation Used
- Weather Condition
- Region

🛠️ **Technical Components**  
- **ML Model**: Linear Regression Model (or another model you are using)
- **API**: FastAPI for providing predictions via an endpoint
- **Crop Yield Predictor**: Custom logic for crop yield prediction
- **Linear Regression**: Implementation of linear regression model with dataset
- **Mobile App**: (Optional, if you're building a mobile interface)

🎥 **Video Demo**  
[Demo Video Link]  
- App prediction demo
- API testing via Swagger UI
- Model performance comparison

🔗 **Live API Documentation**  
- **Swagger UI**: [API Docs](https://your-api-url.com/docs)
- **Endpoint**: `POST https://your-api-url.com/predict`

**Example Request:**
```json
{
  "Rainfall_mm": 1800,
  "Temperature_Celsius": 45,
  "Soil_Type": 1,
  "Fertilizer_Used": 1,
  "Irrigation_Used": 1,
  "Weather_Condition": 2,
  "Region": 0
}
**Example Response:**
```json
{
  "prediction": 8.26,
  "units": "tons_per_hectare"
}
```
🛠️ Installation Guide

Clone the repository:
git clone https://github.com/Diana-codes/linear_regression_model.git

cd linear_regression_model

Run Jupyter Notebook

(if you're using a Jupyter notebook for the model):

cd summative/linear_regression

jupyter notebook model.ipynb

Start the API (to expose the model as an API):

cd summative/API

pip install -r requirements.txt

uvicorn app:app --reload

Run the Crop Yield Predictor

cd summative/crop_yield_predictor

python predict.py

📂 Repository Structure


linear_regression_model/
├── summative/
│   ├── linear_regression/        # Jupyter notebook & dataset
│   ├── API/                     # FastAPI implementation for the model
│   ├── crop_yield_predictor/    # Custom logic for crop yield prediction
└── README.md

License

This version:


Uses simple Markdown formatting

Includes all required sections

Provides clear installation steps

Shows API documentation

Links to demo video
