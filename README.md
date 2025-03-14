# NestDriver - C-Shared Go Library with Submodule Dependencies

NestDriver demonstrates building a Go library as a C-shared object, integrating C code from a submodule. This setup facilitates interaction between Go and C, useful for performance-critical components or leveraging existing C libraries.

## Getting Started

1.  **Clone the Repository:**

    ```bash
    git clone https://github.com/crux161/NestDriver.git 
    cd NestDriver
    ```


2.  **Build the Project:**

    ```bash
    make -j $(nproc)
    make run
    ```

