npm install
openapi-generator-cli version
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
BASEDIR=$(dirname "$SCRIPTPATH")
openapi-generator-cli validate -i $BASEDIR/api/spec.yaml
openapi-generator-cli generate -i $BASEDIR/api/spec.yaml \
-g typescript-axios \
-o $BASEDIR/api/build/ts_client \
