# Use a slim version of Python 3.7 as the base image
FROM python:3.7-slim

# Set the working directory inside the container
WORKDIR /app

# Install pipenv for managing dependencies
RUN pip install pipenv

# Copy Pipfile and Pipfile.lock to leverage Docker's cache
COPY Pipfile Pipfile.lock ./

# Install the dependencies in a production environment according to Pipfile.lock
RUN pipenv install --deploy --ignore-pipfile

# Copy the rest of the application code to the container
COPY . .

# Expose port 5000 for communication with the server
EXPOSE 5000

# Command to run the application when the container starts
CMD ["pipenv", "run", "python", "app.py"]
