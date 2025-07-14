# Personality and Social Psychology Analysis

This project analyzes a personality dataset to understand the relationships between different personality traits and builds a classification model to predict a target variable based on these traits.

## Dataset

The dataset used in this project is `personality_dataset.csv`, which is located in the `data` directory. It contains information about various personality traits.

## Project Structure

- `personality_analysis.ipynb`: Contains the exploratory data analysis (EDA), including visualizations and initial findings.
- `model_building.ipynb` and `model_building_updated.ipynb`: These notebooks cover the development, training, and evaluation of machine learning models for classification.
- `requirements.txt`: Lists the necessary Python libraries to run the project.
- `data/`: This directory contains the dataset.

## Installation

To run this project, you need to have Python installed. You can then install the required dependencies using pip:

```bash
pip install -r requirements.txt
```

## Usage

1.  Clone the repository:
    ```bash
    git clone <repository-url>
    ```
2.  Navigate to the project directory:
    ```bash
    cd personality
    ```
3.  Install the dependencies:
    ```bash
    pip install -r requirements.txt
    ```
4.  Open and run the Jupyter Notebooks to see the analysis and model building process:
    - `personality_analysis.ipynb`
    - `model_building.ipynb`
    - `model_building_updated.ipynb`

## Exploratory Data Analysis

The `personality_analysis.ipynb` notebook contains a detailed exploratory data analysis of the dataset. This includes:
-   Descriptive statistics of the dataset.
-   Visualizations of the distributions of different personality traits.
-   Correlation analysis between different variables.

## Model Building and Results

The `model_building.ipynb` and `model_building_updated.ipynb` notebooks detail the process of building and evaluating a classification model. The following steps were taken:

1.  **Data Preprocessing:** The data was cleaned and prepared for modeling.
2.  **Feature Engineering:** Relevant features were selected and engineered.
3.  **Model Training:** Several classification models were trained on the dataset, including Logistic Regression, Random Forest, and Gradient Boosting.
4.  **Model Evaluation:** The models were evaluated using various metrics such as accuracy, precision, recall, and F1-score. The best performing model was selected.

## Contributing

Contributions to this project are welcome. Please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.
