##  Use the folowing to create my personalized image
FROM ubuntu/squid

RUN apt update
RUN apt -y full-upgrade
RUN apt -y install nano wget squidguard

RUN cd
RUN mkdir ./squidguard
RUN mkdir ./squidguarderrors

RUN chown -R proxy:proxy /var/lib/squidguard
ENTRYPOINT ["squid"]
CMD ["-sNYC"]
