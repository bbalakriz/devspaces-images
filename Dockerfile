FROM registry.redhat.io/devspaces/udi-rhel8

USER 0

# Install dnf-plugins-core, configure the HashiCorp repository, and install required packages
RUN dnf install -y dnf-plugins-core && \
    dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo && \
    dnf install -y terraform bind-utils python3-pip python3-devel telnet && \
    pip3 install ansible-navigator ansible ansible-lint && \
    dnf clean all

# Adjust permissions for the ${HOME} directory
RUN chmod -R g=u ${HOME}

USER 10001

# Remove the pre-installed Node.js v20.3
# RUN dnf remove -y nodejs && \
#     dnf clean all

# Install Node.js v22.13.11
# RUN curl -fsSL https://rpm.nodesource.com/setup_22.x | bash - && \
#     dnf install -y nodejs-22.13.11 && \
#     dnf clean all


