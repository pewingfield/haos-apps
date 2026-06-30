FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:10.0 AS build-env
WORKDIR /App
ARG CACHE_BUST=1.6.8
RUN apt-get update && apt-get install -y git && \
    git clone --branch v1.6.8 --depth 1 https://github.com/hargata/lubelog.git . && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
COPY haos.patch .
RUN git apply haos.patch
RUN dotnet restore -a amd64
RUN dotnet publish -a amd64 -c Release -o out

FROM ubuntu:24.04
WORKDIR /App
COPY --from=build-env /App/out .
COPY run.sh /run.sh
RUN apt-get update && apt-get install -y curl python3 nginx ca-certificates openssl && \
    curl -fsSL https://packages.microsoft.com/config/ubuntu/24.04/packages-microsoft-prod.deb -o packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y aspnetcore-runtime-10.0 && \
    rm -rf /var/lib/apt/lists/* && \
    openssl req -x509 -nodes -days 3650 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl.key \
    -out /etc/nginx/ssl.crt \
    -subj "/CN=lubelogger" && \
    ln -s /data /App/data && \
    mkdir -p /root/.aspnet && \
    ln -s /data/keys /root/.aspnet/DataProtection-Keys && \
    chmod +x /run.sh
EXPOSE 8080
CMD ["/run.sh"]
