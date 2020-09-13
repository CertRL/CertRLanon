ARG coq_image="coqorg/coq:8.11.2"
FROM ${coq_image}

MAINTAINER anonymous "anon@anon.com"

# needs to be a subdirectory to avoid causing problems with
# the /home/coq/.opam directory (and probably other stuff)
WORKDIR /home/coq

COPY --chown=coq:coq CertRL.opam ./cert_rl/

RUN ["/bin/bash", "--login", "-c", "set -x \
  && if [ -n \"${COMPILER_EDGE}\" ]; then opam switch ${COMPILER_EDGE} && eval $(opam env); fi \
  && opam update -y \
  && opam install --deps-only --with-doc -y -j ${NJOBS} ./cert_rl \
  && opam clean -a -c -s --logs"]


COPY --chown=coq:coq _CoqProject Makefile Makefile.coq_modules ./cert_rl/
COPY --chown=coq:coq coq ./cert_rl/coq

RUN ["/bin/bash", "--login", "-c", "set -x && cd cert_rl && \
     make && make doc"]
