FROM registry.redhat.io/devspaces/udi-rhel8

USER 0

# Install dnf-plugins-core and configure the HashiCorp repository, then install terraform and bind-utils
RUN dnf install -y dnf-plugins-core && \
    dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo && \
    dnf install -y terraform bind-utils && \
    dnf clean all

USER 10001
