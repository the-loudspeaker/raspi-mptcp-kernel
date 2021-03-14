Custom MPTCP kernel for Ubuntu 20.04. 
This kernel is based on 5.4 kernel from upstream.
Instructions to install:

1. After cloning do a sudo dpkg -i *.deb in this folder.
2. Copy mptcp_up to /etc/network/if-up.d/ and make it executable.
3. Copy mptcp_down to /etc/network/if-down.d/ and make it executable.
