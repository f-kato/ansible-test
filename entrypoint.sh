#!/bin/ash

FIND_CMD="find . \( -not -name "__init__.py" -a -not -name "." \) \( -type f -o -type d \) -maxdepth 1"
MY_DIR="/home/my_modules"

if [ -e ${MY_DIR}/library ];
then
    cd ${MY_DIR}/library
    eval ${FIND_CMD} | awk -F/ '{print $NF}' | \
      xargs -I{} ln -s ${MY_DIR}/library/{} /home/ansible/lib/ansible/modules/{}
fi

if [ -e ${MY_DIR}/module_utils ];
then
    cd ${MY_DIR}/module_utils
    eval ${FIND_CMD} | awk -F/ '{print $NF}' | \
      xargs -I{} ln -s ${MY_DIR}/library/{} /home/ansible/lib/ansible/module_utils/{}
fi

if [ -e ${MY_DIR}/test/units/modules ];
then
    cd ${MY_DIR}/test/units/modules
    eval ${FIND_CMD} | awk -F/ '{print $NF}' | \
      xargs -I{} ln -s ${MY_DIR}/test/units/modules/{} /home/ansible/test/units/modules/{}
fi

if [ -e ${MY_DIR}/test/units/module_utils ];
then
    cd ${MY_DIR}/test/units/module_utils
    eval ${FIND_CMD} | awk -F/ '{print $NF}' | \
      xargs -I{} ln -s ${MY_DIR}/test/units/module_utils/{} /home/ansible/test/units/module_utils/{}
fi

cd /home/ansible

exec "$@"

