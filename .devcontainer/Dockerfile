# https://github.com/devcontainers/images/tree/main/src/cpp/.devcontainer
# [Choice] Debian / Ubuntu version (use Debian 11, Ubuntu 18.04/22.04 on local arm64/Apple Silicon): debian-11, debian-10, ubuntu-22.04, ubuntu-20.04, ubuntu-18.04
ARG VARIANT=debian-11
FROM mcr.microsoft.com/devcontainers/base:0-${VARIANT}
USER root

# Install needed packages. Use a separate RUN statement to add your own dependencies.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install build-essential cmake cppcheck valgrind clang lldb llvm gdb \
        libsfml-dev \
        libsfml-audio2.5 \
        libsfml-graphics2.5 \
        libsfml-network2.5 \
        libsfml-system2.5 \
        libsfml-window2.5 \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Setup ENV vars for vcpkg
ENV VCPKG_ROOT=/usr/local/vcpkg \
    VCPKG_DOWNLOADS=/usr/local/vcpkg-downloads
ENV PATH="${PATH}:${VCPKG_ROOT}"

ARG USERNAME=vscode

# Install vcpkg itself: https://github.com/microsoft/vcpkg/blob/master/README.md#quick-start-unix
COPY base-scripts/install-vcpkg.sh /tmp/
RUN chmod +x /tmp/install-vcpkg.sh \
    && ./tmp/install-vcpkg.sh ${USERNAME} \
    && rm -f /tmp/install-vcpkg.sh

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/

ARG SCRIPTS_DIR=/tmp/scripts
COPY scripts $SCRIPTS_DIR
RUN $SCRIPTS_DIR/apt/install_opengl_deps.bash \
    && $SCRIPTS_DIR/apt/install_sfml_deps.bash
