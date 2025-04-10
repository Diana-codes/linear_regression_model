# 🌾 Crop Yield Prediction System

---

## 📌 Overview

This machine learning system predicts crop yield based on various environmental and agricultural factors.  
By analyzing relationships between factors like rainfall, temperature, soil type, and more,  
it provides accurate predictions to help farmers optimize their farming techniques and improve crop productivity.

---

## 📌 Project Overview

The system predicts crop yield in tons per hectare using the following parameters:

- 🌧️ Rainfall (mm)  
- 🌡️ Temperature (°C)  
- 🧪 Soil Type  
- 🌿 Fertilizer Used  
- 🚿 Irrigation Used  
- ☁️ Weather Condition  
- 📍 Region  

---

## 🛠️ Technical Components

- 🤖 **ML Model**: Linear Regression (or your chosen model)  
- 🔌 **API**: FastAPI for serving predictions  
- 📈 **Crop Yield Predictor**: Custom logic for generating yield predictions  
- 📊 **Notebook**: Jupyter Notebook for model training and evaluation  
- 📱 **Mobile App**: *(Optional)* Flutter cross-platform mobile interface  

---

## 🎥 Video Demo

[🔗 Demo Video Link](#) *(replace this with your actual link)*

Demo includes:

- ✅ API testing via Swagger UI  
- 📱 Mobile app prediction  
- 📊 Model performance comparison  

---

## 🔗 Live API Documentation

- **Swagger UI**: [View Docs](https://your-api-url.com/docs) *(replace with your actual link)*  
- **Endpoint**:  
  `POST https://your-api-url.com/predict`

### 📤 Example Request

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
📥 Example Response
json
Copy
Edit
{
  "prediction": 8.26,
  "units": "tons_per_hectare"
}
🛠️ Installation Guide
🔃 Clone the Repository
bash
Copy
Edit
git clone https://github.com/Diana-codes/linear_regression_model.git
cd linear_regression_model
🧪 Run Jupyter Notebook
bash
Copy
Edit
cd summative/linear_regression
jupyter notebook model.ipynb
🚀 Start the API
bash
Copy
Edit
cd ../API
pip install -r requirements.txt
uvicorn app:app --reload
🌾 Run the Crop Yield Predictor
bash
Copy
Edit
cd ../crop_yield_predictor
python predict.py
📂 Project Structure
bash
Copy
Edit
linear_regression_model/
│
├── summative/
│   ├── linear_regression/         # Jupyter notebook & dataset
│   ├── API/                       # FastAPI implementation
│   └── crop_yield_predictor/     # Custom prediction logic
│
└── README.md                      # Project documentation
🪪 License
MIT License © 2024 Diana Uwase
