📱 Mobile App Demo (2 minutes)
Script:
"Here’s our Crop Yield Predictor mobile app in action. Let’s test a prediction:"

Open the app (show the UI briefly).

Fill in sample inputs:

"We’ll enter rainfall: 120mm, temperature: 25°C, loam soil, sunny weather… and enable irrigation."

Tap "Predict":

Show the loading state.

Display results: "The model predicts 1,850 kg/ha yield for these conditions."

Key Focus:

Smooth UI flow

Clear input/output visibility

🛠️ Swagger UI API Test (1 minute)
Script:
"Now, let’s validate the API behind the app using Swagger UI:"

Open Swagger in a browser (show the /predict endpoint).

Send a sample request:

json
Copy
{
  "rainfall": 120,
  "temperature": 25,
  "soilType": 2,
  "irrigationUsed": true
}
Show the response:

Highlight the prediction value and response time.

Key Focus:

Prove the API works independently

Show request/response structure

📊 Model Deployment & Performance (2 minutes)
Script:
"Our model deployment pipeline used three algorithms trained on [X] samples of agricultural data:"

Performance Comparison:

"Linear Regression achieved an MSE of 150, Random Forest: 120, Decision Tree: 135."

"Random Forest performed best due to handling non-linear relationships in our dataset."

Dataset Impact:

"Features like rainfall and soil type had high correlation with yield (show a correlation plot if possible)."

"We normalized the data to address scale differences."

Model Selection Justification:

"We chose Random Forest for its balance of accuracy and interpretability, despite slightly higher training time."

Key Focus:

Metrics-driven insights

Link dataset traits to model choice

🎬 Production Tips
Camera Setup:

Face the camera directly with good lighting.

Show the app on your phone (not emulator) for authenticity.

Editing:

Use zoom-ins for key moments (e.g., prediction result).

Add subtitles for metric values (e.g., "MSE: 120").

Practice:

Time each section to stay under 3 minutes per demo.

Example Transition Phrases
"Now, let’s peek under the hood at the models..."

"As you saw in the app, the API delivers this result in real-time..."import joblib

# Select the best model
best_model = None
best_mse = min(dt_mse, rf_mse)  # Compare MSE for Decision Tree and Random Forest

if best_mse == dt_mse:
    print("Saving Decision Tree model as best...")
    best_model = dt_model  # Assign the trained Decision Tree model
    joblib.dump(best_model, 'best_decision_tree.pkl')

else:
    print("Saving Random Forest model as best...")
    best_model = rf_model  # Assign the trained Random Forest model
    joblib.dump(best_model, 'best_random_forest.pkl')

print("Best model saved successfully!")


