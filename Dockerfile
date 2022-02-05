FROM parasoft/cpptest

ARG USER_ID=1001

# install ca-certificates
# be sure to use the 'root' user to install new packages
USER root
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN  useradd --create-home --uid ${USER_ID} ciuser && \
     echo "ciuser:parasoft" | chpasswd && \
     adduser ciuser sudo

USER parasoft:parasoft

COPY cpptestcli.properties /home/parasoft/

USER ciuser

RUN cd /home/ciuser && mkdir actions-runner && cd actions-runner && \
    curl -o actions-runner-linux-x64-2.286.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.286.1/actions-runner-linux-x64-2.286.1.tar.gz && \
    tar xzf ./actions-runner-linux-x64-2.286.1.tar.gz

