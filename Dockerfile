FROM python:3.11.3-slim
ARG VERSION

LABEL maintainer="Tat <tat@seriousexplosion.net>"

WORKDIR /app
COPY nicegui_practice /app

ENV POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_CREATE=false \
    \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    \
    PYSETUP_PATH="/opt/pysetup"

ENV PATH="$POETRY_HOME/bin:$PATH"

RUN apt-get update && \
    apt-get install --no-install-recommends -y curl && \
    apt-get clean

RUN curl -sSL https://install.python-poetry.org/ | python -

# packages install
COPY pyproject.toml /pyproject.toml
RUN poetry install --no-root
# RUN poetry run playwright install && playwright install-deps

ENV FILENAME="date.py"
EXPOSE 8080

CMD python3 $FILENAME