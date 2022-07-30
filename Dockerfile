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

# tfsec
ENV TFSEC_VER=1.26.3
RUN curl -Lso tfsec https://github.com/tfsec/tfsec/releases/download/v${TFSEC_VER}/tfsec-linux-amd64 && \
    chmod +x tfsec && mv tfsec /usr/local/bin/

# tflint
ENV TFLINT_VER=0.39.1
RUN curl --fail --silent -L -o /tmp/tflint.zip https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VER}/tflint_linux_amd64.zip && \
    unzip /tmp/tflint.zip -d /tmp/ && \
    install -c -v /tmp/tflint /usr/local/bin/ && \
    rm /tmp/tflint*

# tflint rule
ENV TFLINT_RULE_SET_AWS_VER=0.15.0
RUN mkdir -p  ~/.tflint.d/plugins/github.com/terraform-linters/tflint-ruleset-aws/${TFLINT_RULE_SET_AWS_VER}/ && \
    curl --fail --silent -L -o /tmp/tflint-ruleset-aws.zip https://github.com/terraform-linters/tflint-ruleset-aws/releases/download/v${TFLINT_RULE_SET_AWS_VER}/tflint-ruleset-aws_linux_amd64.zip && \
    unzip /tmp/tflint-ruleset-aws.zip -d ~/.tflint.d/plugins/github.com/terraform-linters/tflint-ruleset-aws/${TFLINT_RULE_SET_AWS_VER}/ && \
    rm /tmp/tflint-ruleset-aws.zip

ENTRYPOINT [ "ash" ]
