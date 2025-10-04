# Bad
RUN apt-get update
RUN apt-get install -y package1
RUN apt-get install -y package2

# Good
RUN apt-get update && \
    apt-get install -y \
        package1 \
        package2 \
    && rm -rf /var/lib/apt/lists/*
