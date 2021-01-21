#!/bin/sh
. /software/common64/dsmlp/bin/kubevars.sh

set -a # mark all variables below as exported (environment) variables

# Indentify this script as source of job configuration
K8S_CONFIG_SOURCE=${BASH_SOURCE[0]}
K8S_NUM_GPU=0 # max of 2 (contact ETS to raise limit)
K8S_NUM_CPU=2 # max of 8 ("")
K8S_GB_MEM=8 # max of 64 ("")

# Controls whether an interactive Bash shell is started
SPAWN_INTERACTIVE_SHELL=YES
K8S_DOCKER_IMAGE="neo4j:latest"
NEO4J_AUTH="neo4j/test"

POD_NAME="neo4j"

# FIXME - this should be set by "kubevars" above
# remove this line once available
K8S_HOME_DIR=

K8S_EXTRA_ENV=$(cat <<-EOM
    - name: NEO4J_AUTH
      value: ${NEO4J_AUTH}
    - name: NEO4J_dbms_directories_logs
      value: ${K8S_HOME_DIR}/neo4j/logs
    - name: NEO4J_dbms_directories_data
      value: ${K8S_HOME_DIR}/neo4j/data
    - name: NEO4J_dbms_directories_import
      value: ${K8S_HOME_DIR}/neo4j/import
EOM
)

# Sets up proxy URL for Jupyter notebook inside
PROXY_PORT=7474:7687
K8S_ENTRYPOINT="/docker-entrypoint.sh"
K8S_ENTRYPOINT_ARGS_EXPANDED="neo4j"

exec ./launch-env-agt.sh -S "$@"
