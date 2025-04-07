🌾 Crop Yield Prediction System
📱 FastAPI + (Optional) Mobile App + Machine Learning Demo

📌 Overview
This machine learning system predicts crop yield using key environmental and agricultural parameters. By analyzing factors such as rainfall, soil type, and weather conditions, it provides accurate yield forecasts to help farmers optimize productivity.

📌 Project Overview
The system predicts crop yield (in tons per hectare) based on the following parameters:

Rainfall (mm)

Temperature (°C)

Soil Type

Fertilizer Used

Irrigation Used

Weather Condition

Region

🛠️ Technical Components
ML Model: Linear Regression (or alternative regression model)

API: FastAPI backend for model inference

Crop Yield Predictor: Custom logic for handling predictions

Mobile App: (Optional) Mobile interface for predictions

Swagger Docs: API testing and documentation UI

🎥 Video Demo
Demo covers:

Model prediction using sample input

Swagger UI API test walkthrough

Model performance overview

🔗 Watch Demo Video

🔗 Live API Documentation
Swagger UI:
API Docs

Endpoint:
POST https://your-api-url.com/predict

Example Request:
json
Copy
Edit
{
  "Rainfall_mm": 1800,
  "Temperature_Celsius": 45,
  "Soil_Type": 1,
  "Fertilizer_Used": 1,
  "Irrigation_Used": 1,
  "Weather_Condition": 2,
  "Region": 0
}
Example Response:
json
Copy
Edit
{
  "prediction": 8.26,
  "units": "tons_per_hectare"
}
🛠️ Installation Guide
1. Clone the repository:
bash
Copy
Edit
git clone https://github.com/Diana-codes/linear_regression_model.git
cd linear_regression_model
2. Run Jupyter Notebook (for model exploration)
bash
Copy
Edit
cd summative/linear_regression
jupyter notebook model.ipynb
3. Start the API server
bash
Copy
Edit
cd ../API
pip install -r requirements.txt
uvicorn app:app --reload
4. Run the Crop Yield Predictor (Optional)
bash
Copy
Edit
cd ../crop_yield_predictor
python predict.py
📂 Repository Structure
bash
Copy
Edit
linear_regression_model/
├── summative/
│   ├── linear_regression/      # Jupyter notebook & dataset
│   ├── API/                    # FastAPI implementation for the model
│   ├── crop_yield_predictor/  # Custom prediction logic
└── README.md
🪪 License
This version:

Uses clean, organized Markdown

Includes all critical project sections

Provides detailed setup instructions

Links to demo and Swagger documentation

Maintains readable structure

MIT License © 2023 Diana Ruzindana
