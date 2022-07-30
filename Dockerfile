FROM hashicorp/terraform:1.2.5
ENV GLIBC_VER=2.34-r0

RUN apk update && \
    apk --no-cache add \
    docker-cli \
    binutils \
    make \
    curl && \
    curl -sL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub && \
    curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-${GLIBC_VER}.apk && \
    curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-bin-${GLIBC_VER}.apk && \
    apk add --no-cache glibc-${GLIBC_VER}.apk glibc-bin-${GLIBC_VER}.apk

# aws-cli-v2
RUN curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip && \
    unzip -q awscliv2.zip && \
    aws/install

# tfsec
RUN curl -Lso tfsec https://github.com/tfsec/tfsec/releases/download/v1.26.3/tfsec-linux-amd64 && \
    chmod +x tfsec && mv tfsec /usr/local/bin/

ENTRYPOINT [ "ash" ]
