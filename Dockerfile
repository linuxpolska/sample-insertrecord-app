FROM ruby:2.6
COPY . /app/
WORKDIR /app
ENV RAILS_ENV=development
RUN apt-get update; \
    apt-get install -y nodejs; \
    rm -f Gemfile.lock; \
    rm -f db/*.sqlite3; \
    rm -f log/* ; \
    bundle install; \
    chmod +x run-server.sh; \
    useradd -M -r -s /sbin/fail insert-record; \
    chown -R insert-record. /app
USER insert-record
ENV DATABASE_URL='sqlite3:db/db.sqlite3?pool=5'
ENV APP_TITLE='Insert Record - Test Application'
ENV RAILS_LOG_TO_STDOUT='true'
ENTRYPOINT [ "./run-server.sh" ]
EXPOSE 3000