## Alpine Linux SDK

Docker image to compile and package [google-authenticator](https://github.com/google/google-authenticator) under Alpine Linux.

Run it with

    docker-compose run sdk
    # Then in container
    abuild -r
    # Or to iterate steps
    abuild deps # Download and install dependencies
    abuild build # Repeat as needed
