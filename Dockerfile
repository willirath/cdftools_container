FROM debian:buster as builder

RUN \
    apt update && \
    apt install -y libnetcdf-dev libnetcdff-dev gfortran build-essential git

RUN \
    git clone https://github.com/meom-group/CDFTOOLS && \
    cd CDFTOOLS/src && \
    ln -s ../Macrolib/macro.gfortran make.macro && \
    make clean && \
    make


FROM debian:buster

RUN \
    apt update && \
    apt install -y libnetcdf-dev libnetcdff-dev gfortran build-essential && \
    apt autoremove --yes && apt clean --yes && apt autoclean --yes  && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app/bin

ENV PATH="${PATH}:/app/bin"

COPY --from=builder /CDFTOOLS/bin/* /app/bin/.


