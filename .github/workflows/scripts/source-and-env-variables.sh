#!/bin/bash
set -xv
## Environment
cd
ls -la
cd /__w/newrelic-ruby-agent/newrelic-ruby-agent
HOME=/root
cat /root/.bashrc
source /root/.bashrc
RBENV_BIN="/root/.rbenv/bin/rbenv"
export PATH=${RBENV_BIN}:$PATH