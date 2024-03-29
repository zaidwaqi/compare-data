FROM quay.io/centos/centos:stream8

RUN dnf install -y glibc-langpack-en python3.11 make

# Create and activate virtual environment
RUN python3.11 -m venv /venv
ENV PATH="/venv/bin:$PATH"

COPY requirements.txt /tmp/requirements.txt

# Install Twine in Python
RUN python3.11 -m pip install -r /tmp/requirements.txt


# Set virtual environment as entrypoint
ENTRYPOINT ["/bin/bash"]