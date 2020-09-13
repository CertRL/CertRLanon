# CertRL [![Build Status](https://travis-ci.com/CertRL/CertRLanon.svg?branch=master)](https://travis-ci.com/CertRL/CertRLanon)
CertRL: Formalizing Convergence Proofs for Value and Policy Iteration in Coq

This repository contains a partially anonymized copy of the repository accompanying the CertRL submission.

## Getting Started

To compile the Coq code in this repository, first install opam [opam (ocaml package manager)](https://opam.ocaml.org/).
Add support for coq ocaml repositories: `opam repo add coq-released --set-default https://coq.inria.fr/opam/released`.
If you want to create a local environment (switch), you can run `opam switch create nnsopt 4.07.0`.
Next, run `opam install . --deps-only`.  This should install all the dependencies needed, including Coq.

Once the prerequisites are installed, run `make` to compile it.

Alternatively, the included Docker file can be built using Docker to compile the coq code in a suitable environment.
`docker build --pull -t cert-rl .`


This repository is distributed under the terms of the Apache 2.0 License, see LICENSE.txt.
It is currently in an Alpha release, without warranties of any kind.  Keep in mind that this is an active exploratory research project.
