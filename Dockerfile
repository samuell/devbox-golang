# Re-use the phusion baseimage which runs an SSH server etc
FROM phusion/baseimage

# Some definitions
ENV SUDOFILE /etc/sudoers
ENV SSHKEYFILE vagrantssh.key

# Do what?
RUN rm -f /etc/service/sshd/down

# Import the newly generated public key into the docker image
ADD keys/${SSHKEYFILE}.pub /tmp/${SSHKEYFILE}.pub

# Install the public key for root user
RUN cat /tmp/${SSHKEYFILE}.pub >> /root/.ssh/authorized_keys

# Create vagrant user
RUN useradd --shell /bin/bash --create-home --base-dir /home --user-group --groups sudo,ssh --password '' vagrant

# Install the public key for vagrant user
RUN mkdir -p /home/vagrant/.ssh
RUN cat /tmp/${SSHKEYFILE}.pub >> /home/vagrant/.ssh/authorized_keys
RUN chown -R vagrant:vagrant /home/vagrant/.ssh

# Remove the temporary location for the key
RUN rm -f /tmp/${SSHKEYFILE}.pub

# Update apt-cache, so that stuff can be installed
RUN apt-get -y update
# Install python (otherwise ansible will not work)
RUN apt-get -y install python
# Install aptitude, since ansible needs it (only apt-get is installed)
RUN apt-get -y install aptitude

# Enable password-less sudo for all user (including the 'vagrant' user)
RUN chmod u+w ${SUDOFILE}
RUN echo '%sudo   ALL=(ALL:ALL) NOPASSWD: ALL' >> ${SUDOFILE}
RUN chmod u-w ${SUDOFILE}
