FROM registry.redhat.io/devspaces/udi-rhel8

USER 0

# Install dnf-plugins-core, configure the HashiCorp repository, and install required packages
RUN dnf install -y dnf-plugins-core && \
    dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo && \
    dnf install -y terraform bind-utils python3-pip python3-devel && \
    pip3 install ansible-navigator ansible ansible-lint && \
    dnf clean all

# Adjust permissions for the ${HOME} directory
RUN chmod -R g=u ${HOME}

USER 10001
