#!/bin/bash

read -p "Enter your name : " name

if [[ -z "$name" ]]; then
    echo "Error: Name cannot be empty!"
    exit 1
fi

mkdir -p submission_reminder_$name

cd submission_reminder_$name

mkdir -p app modules assets config

cat > app/reminder.sh << 'EOF'

#!/bin/bash

source ./config/config.env
source ./modules/functions.sh

submissions_file="./assets/submissions.txt"

echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

cat > modules/functions.sh << 'EOF'

#!/bin/bash

function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    while IFS=, read -r student assignment status; do
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file")
}
EOF

cat > assets/submissions.txt << 'EOF'

student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Mendeleev, Vi, not submitted
Bohr, Shell Navigatiom, submitted
Einstein, Shell Permissions, not submitted
Galilei, Git, submitted
Newton, Shell Navigation, submitted
Faraday, Vi, not submitted
EOF

cat > config/config.env << 'EOF'

ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

cat > startup.sh << 'EOF'

#!/bin/bash

echo "SUBMISSION  REMINDER APPLICATION"
echo -e "--------------------------------------------"

if [[ ! -d "app" || ! -d "modules" || ! -d "assets" || ! -d "config" ]]; then
    echo "Error: Please run this script from the application root directory"
    exit 1
fi
bash app/reminder.sh
EOF

chmod +x startup.sh modules/functions.sh
echo "To test the application :"
echo "1. cd submission_reminder_$name "
echo "2. bash startup.sh"
