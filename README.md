# SUBMISSION REMINDER APPLICATION

A Linux-based application that helps track and remind students about pending assignment submissions.

## Features
- Student submission tracking
- Assignment management
- Flexible configuration

## Prerequisites
- Linux/Unix environment
- Bash shell
- Basic command line knowledge

## Installation & Setup

1. **Clone the repository**
   ```
   git clone https://github.com/banituze/submission_reminder_app_banituze.git
   cd submission_reminder_app_banituze
   ```

2. **Run the environment setup**
   ```
   bash create_environment.sh
   ```
   - Enter your name when prompted
   - This creates the complete application structure

## Usage

### Running the Main Application
```
cd submission_reminder_[YourName]
bash startup.sh
```

### Example Output
![Example Output](https://i.imgur.com/WhJN82C.png)

### Updating Assignment Name
Edit the `config/config.env` file in your application directory:
```
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
```

### Adding More Students
Edit the `assets/submissions.txt` file in your application directory:
```
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Mendeleev, Vi, not submitted
Bohr, Shell Navigation, submitted
Einstein, Shell Permissions, not submitted
Galilei, Git, submitted
Newton, Shell Navigation, not submitted
Faraday, Vi, submitted
```

## File Structure
```
submission_reminder_<name>/
├── app/
│   └── reminder.sh             # Main reminder logic
├── assets/
│   └── submissions.txt         # Student submission records
├── config/
│   └── config.env              # Application configuration
├── modules/
│   └── functions.sh            # Helper functions
└── startup.sh                  # Application startup script
```

## Troubleshooting
- Ensure all `.sh` files have execute permissions
- Check that all required directories exist

## Author
```
Winebald 
```
