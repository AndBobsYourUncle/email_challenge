web: jemalloc.sh bin/start-stunnel puma -C config/puma.rb
emails: QUEUE=emails jemalloc.sh bin/start-stunnel rails resque:work
