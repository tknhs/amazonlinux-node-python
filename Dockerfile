FROM amazonlinux:2017.03.1.20170812

RUN yum update -y && \
    yum install -y \
    gcc-c++ \
    make \
    wget \
    curl \
    xz \
    tree \
    zlib-devel \
    openssl-devel \
    readline-devel \
    ncurses-devel \
    sqlite-devel \
    expat-devel \
    bzip2-devel \
    tcl-devel \
    tk-devel \
    gdbm-devel

# Install Python 3.6
RUN wget https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tar.xz && \
    tar xJf Python-3.6.0.tar.xz && \
    cd Python-3.6.0 && \
    ./configure && \
    make && \
    make install && \
    cd ../ && \
    rm Python-3.6.0.tar.xz && \
    rm -rf Python-3.6.0

# Install node 8.x
RUN wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
RUN yum install -y nodejs yarn

RUN ln -f -s /usr/local/bin/python3.6 /usr/bin/python && \
    ln -f -s /usr/local/bin/pip3.6 /usr/bin/pip

CMD ["/bin/bash"]
