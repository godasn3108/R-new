FROM redhat/ubi8 as base
RUN subscription-manager register --username=nileshg3108 --password=Redhat@1234 \
&& subscription-manager attach --auto \
&& subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms \
&& dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm \
&& dnf clean all

FROM base as rdep
RUN echo "Installing R" \
&& dnf install -y R-4.1.1-1-1.x86_64.rpm
