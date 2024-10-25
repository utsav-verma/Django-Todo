# Use the official Python image
FROM python:3

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file first to leverage Docker's cache mechanism
# COPY requirements.txt .

# # Install dependencies listed in requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt
RUN pip install django==3.2
# Copy the rest of the code into the container
COPY . .

# Run database migrations
RUN python manage.py migrate

# Expose the port (optional, for clarity)
EXPOSE 8001

# Set the default command to run the Django app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]
