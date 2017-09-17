# Use an official Python runtime as a parent image
FROM python:3.6-slim

# Set the working directory to current directory
WORKDIR .

# Copy the current directory contents into the container at current directory
ADD . .

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# apply django database migrations
RUN python ./manage.py migrate

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV PYTHONUNBUFFERED 1

# Run app when the container launches
CMD ["python", "./manage.py", "runserver", "0.0.0.0:80"]
