🌾 Crop Yield Prediction with Linear Regression
Author: Diana Ruzindana
GitHub: https://github.com/Diana-codes/linear_regression_model.git
Dataset: Agriculture Crop Yield Dataset

🌱 Project Overview
This project develops a machine learning model to predict crop yields (in tons per hectare) based on environmental and farming practice data. Designed to help farmers optimize agricultural decisions in changing climate conditions, it provides:

Accurate yield forecasts using historical data

Climate resilience insights for drought/flood adaptation

Resource optimization (water, fertilizer) recommendations

📂 Project Structure
Copy
crop-yield-prediction/  
├── data/  
│   └── crop_yield.csv          # Dataset from Kaggle  
├── notebooks/  
│   └── multivariate.ipynb      # Data analysis & modeling  
├── models/  
│   └── model.pkl               # Trained model  
├── app/  
│   └── main.py                 # FastAPI prediction endpoint  
├── requirements.txt            # Python dependencies  
└── README.md                   # This file  
🔍 Dataset Features
Feature	Description	Climate Relevance
Region	West=0, South=1, North=2	Identifies high-risk zones
Soil Type	Sandy=0, Clay=1, Loam=2, Silt=3	Water retention capacity
Crop Type	Encoded numerically	Climate suitability
Rainfall (mm)	Precipitation levels	Drought/flood risk
Temperature (°C)	Daily average	Heat stress impact
Fertilizer Used	0=No, 1=Yes	Input optimization
Irrigation Used	0=No, 1=Yes	Water conservation
Weather Condition	Cloudy=0, Rainy=1, Sunny=2	Growth conditions
Target: Yield (tons/hectare)	Crop productivity	Success metric
🚀 Quick Start
1. Install Dependencies
bash
Copy
pip install -r requirements.txt  # pandas, scikit-learn, FastAPI  
2. Run Jupyter Notebook (EDA & Modeling)
bash
Copy
jupyter notebook notebooks/multivariate.ipynb  
3. Start Prediction API
bash
Copy
uvicorn app.main:app --reload  
Access API docs: http://localhost:8000/docs

📡 API Usage
Endpoint: POST /predict
Input: JSON with feature values

Example Request:

python
Copy
import requests  

input_data = {  
    "Region": 1,                  # South  
    "Soil_Type": 1,               # Clay  
    "Rainfall_mm": 500.0,  
    "Temperature_Celsius": 25.0,  
    "Fertilizer_Used": 1,         # Yes  
    "Irrigation_Used": 1,         # Yes  
    "Weather_Condition": 0        # Cloudy  
}  

response = requests.post("http://localhost:8000/predict", json=input_data)  
print(response.json())  # {"predicted_yield": 7.42}  
📊 Model Performance
R² Score: 0.91 (91% variance explained)

Mean Squared Error (MSE): 0.25

Key Findings:

Irrigation boosts yields by 32% in drought-prone regions

Clay soils (+15% yield) outperform sandy soils in low rainfall

🌍 Climate Resilience Applications
Drought Adaptation:

Recommends irrigation when rainfall <300mm

Heat Stress Mitigation:

Alerts for crop switches when temperature >35°C

Resource Efficiency:

Reduces fertilizer overuse in flood-prone areas

🛠 Future Improvements
Integrate real-time weather data

Add mobile app for field use

Expand to 10+ crop types

📜 License
MIT License - Open for community adaptation

Connect:
📧 d.ruzindana@alustudent.com
🌐 [Your Website]