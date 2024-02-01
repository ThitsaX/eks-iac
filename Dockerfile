FROM --platform=linux/amd64 alpine:3.19.1 AS builder 
WORKDIR /downloads
RUN  apk add curl wget
RUN wget https://releases.hashicorp.com/terraform/0.12.21/terraform_0.12.21_linux_amd64.zip \
&&  unzip terraform_0.12.21_linux_amd64.zip && rm terraform_0.12.21_linux_amd64.zip
RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.7.0/bin/linux/amd64/kubectl

FROM --platform=linux/amd64 alpine:3.19.1 
RUN apk --no-cache add python3 py3-pip curl aws-cli
COPY --from=builder /downloads/kubectl /usr/local/bin/kubectl
COPY --from=builder /downloads/terraform /usr/bin/terraform
RUN chmod +x /usr/local/bin/kubectl
CMD ["/bin/sh"]


