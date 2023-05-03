FROM python:3.9

RUN mkdir project

# Set the working directory to /app
WORKDIR /project

# Copy the current directory contents into the container at /app
COPY . /project

RUN python -m pip install --upgrade pip

# Install Virtualenv
RUN pip install virtualenv

# Create a virtual environment
RUN virtualenv --python=python3.9 venv

# Activate virtual environment
RUN . venv/bin/activate

# Install the required packages
RUN pip install -r requirements.txt

# Specify the command to run the application
CMD ["python", "app/main.py"]