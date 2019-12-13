FROM archlinux/base

RUN pacman --noconfirm -Syu base-devel boost boost-libs automake git libsodium yasm m4

RUN git clone --recurse-submodules --branch v0.1.3 https://github.com/data61/MP-SPDZ.git

WORKDIR MP-SPDZ
RUN make -j$(nproc) mpir
RUN make -j$(nproc) semi-party.x