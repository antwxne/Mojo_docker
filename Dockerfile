FROM python:3.12.2
MAINTAINER Antoine Desruet <antoine.desruet@epitech.eu>

ARG MODULAR_TOKEN
RUN curl https://get.modular.com | sh - && modular auth $MODULAR_TOKEN
RUN modular install mojo

ENV MODULAR_HOME="/root/.modular"
ENV PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$PATH"

RUN sed -i '/^\[user\]$/ { N; /\nid =/d; }' $MODULAR_HOME/modular.cfg

CMD ["mojo"]
