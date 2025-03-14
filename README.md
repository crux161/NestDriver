# NestDriver - C-Shared Go Library with Submodule Dependencies

NestDriver demonstrates building a Go library as a C-shared object, integrating C code from a submodule. This setup facilitates interaction between Go and C, useful for performance-critical components or leveraging existing C libraries.

## Getting Started

1.  **Clone the Repository:**

    ```bash
    git clone <repository_url>
    cd <repository_name>
    ```

    Replace `<repository_url>` and `<repository_name>` with your actual repository URL and name.

2.  **Build the Project:**

    ```bash
    make
    ```

    This command:

    * Builds the C-shared Go library (`libcgo_test.so`).
    * Builds the C library located in the `nogo` submodule.
    * Moves the resulting `.so` files into the `nest` directory.

3.  **Run the Test Driver:**

    ```bash
    make run
    ```

    This command:

    * Activates a Python virtual environment in the `nest` directory.
    * Executes the Python driver script (`driver.py`) within the virtual environment, testing the C-shared Go library.
    * Deactivates the virtual environment.
