# Savage Schedule

A scheduling application for Savage Conveying.

## Project Structure

```
sav_schedule/
├── frontend/          # Frontend application
│   ├── static/       # Static files (CSS, JS, images)
│   ├── templates/    # HTML templates
│   └── app.py        # Frontend Flask application
├── backend/          # Backend application
│   ├── models/       # Database models
│   ├── routes/       # API routes
│   ├── services/     # Business logic
│   ├── data/         # Data files
│   ├── exports/      # Export files
│   └── app.py        # Backend Flask application
└── .gitignore        # Git ignore rules
```

## Setup Instructions

### Backend Setup

1. Navigate to the backend directory:
   ```bash
   cd backend
   ```

2. Create a virtual environment:
   ```bash
   python -m venv venv
   ```

3. Activate the virtual environment:
   - Windows:
     ```bash
     .\venv\Scripts\activate
     ```
   - Unix/MacOS:
     ```bash
     source venv/bin/activate
     ```

4. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

5. Create a `.env` file with the following variables:
   ```
   DATABASE_URL=sqlite:///app.db
   SECRET_KEY=your-secret-key-here
   SENDGRID_API_KEY=your-sendgrid-api-key-here
   JWT_SECRET_KEY=your-jwt-secret-key-here
   ```

6. Initialize the database:
   ```bash
   python init_db.py
   ```

### Frontend Setup

1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```

2. Create a virtual environment:
   ```bash
   python -m venv venv
   ```

3. Activate the virtual environment:
   - Windows:
     ```bash
     .\venv\Scripts\activate
     ```
   - Unix/MacOS:
     ```bash
     source venv/bin/activate
     ```

4. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

## Running the Application

### Start the Backend Server

1. Navigate to the backend directory
2. Activate the virtual environment
3. Run the Flask application:
   ```bash
   python app.py
   ```

### Start the Frontend Server

1. Navigate to the frontend directory
2. Activate the virtual environment
3. Run the Flask application:
   ```bash
   python app.py
   ```

## Default Login Credentials

- Username: `admin`
- Password: `Coolio03!`

## Development

- Backend API runs on `http://localhost:5001`
- Frontend runs on `http://localhost:5000` 