FROM hashicorp/terraform:1.5.5
RUN  apk --no-cache add python3 py3-pip curl \
&& pip3 install --upgrade pip \
&& pip3 install --no-cache-dir awscli  \
&& curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.7.0/bin/linux/amd64/kubectl \
&& chmod +x ./kubectl \
&& mv ./kubectl /usr/local/bin/kubectl


