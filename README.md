# NestDriver 
## a stupid simple example with cgo and c 

NestDriver demonstrates building a Go library as a C-shared object, integrating C code from a submodule. This setup facilitates interaction between Go and C, useful only as a template for other actual projects.

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
![ili pika](src/pika.png)
