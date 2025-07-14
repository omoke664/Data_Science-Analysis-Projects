# India Staff Data Analysis

## Project Overview

This project performs an in-depth analysis of a staff dataset from a company in India. The primary goal is to derive insights into the company's workforce by examining key metrics related to demographics, compensation, and performance. The analysis is presented through two interactive dashboards: one for a company-wide overview and another for detailed departmental analysis.

## Analysis Questions

This analysis seeks to answer the following questions:

### Company-Level Analysis
1.  What are the summary statistics for employee Age and Salary?
2.  What is the total number of employees and departments?
3.  How is the employee performance rating distributed across the company?
4.  How is salary distributed based on Age, Gender, Department, and Performance Rating?
5.  How do performance ratings vary with Age, Department, and Gender?

### Department-Level Analysis
1.  What are the age and gender distributions within each department?
2.  How does salary vary by Gender, Age, and Performance Rating within a specific department?
3.  What is the total employee count for each department?
4.  What is the performance rating distribution within each department?

## Tools and Techniques

This analysis was conducted entirely within Microsoft Excel, leveraging a range of functions and features to process and visualize the data.

*   **Aggregate Functions:** `AVERAGEIF`, `SUMIFS`, `COUNTIF`, `MAXIFS`, and `MINIFS` were used to calculate summary statistics based on various criteria like department, gender, and rating.
*   **Dynamic Filtering:** A combination of `Data Validation` (to create a dropdown list of departments) and the `FILTER` function was implemented. This allows a user to select a department from a list, which dynamically updates the "Department Dashboard" and the underlying "Department_analysis" sheet to display data for only the selected department.

## Dashboard Overviews

### Company Dashboard
This dashboard provides a high-level, aggregated view of the entire company. Key metrics include:
*   Total Number of Employees
*   Number of Departments
*   Average Employee Age
*   Average Salary
*   Salary Distribution by Age
*   Average Salary by Gender, Department, and Rating

### Departmental Dashboard
This interactive dashboard offers a granular view of a specific department selected by the user. It showcases:
*   Total Employees in the department
*   Average Age in the department
*   Average Salary in the department
*   Salary Distribution by Age
*   Salary Distribution by Gender
*   Employee Performance Chart
*   Gender Distribution Chart

## File Structure

The project is contained within a single Excel workbook with the following sheets:

*   `Data`: Contains the raw, unprocessed staff dataset.
*   `Company Analysis`: Holds all the calculations and summary tables for the company-wide analysis.
*   `Company Dashboard`: Visualizes the data from the `Company Analysis` sheet.
*   `Department_analysis`: Contains the dynamically updated calculations for the selected department.
*   `Department Dashboard`: Visualizes the data from the `Department_analysis` sheet.

### Dataset Columns
The `staff_dataset.xlsx` file includes the following columns:
*   **Name:** Employee's name
*   **Age:** Employee's age
*   **Gender:** Employee's gender
*   **Department:** The department the employee works in
*   **Date Joined:** The date the employee joined the company
*   **Salary:** The employee's salary
*   **Rating:** The employee's performance rating
