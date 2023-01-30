npm install
openapi-generator-cli version
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
BASEDIR=$(dirname "$SCRIPTPATH")
APIDIR=$BASEDIR/api
CLIENTDIR=$APIDIR/build/ts_client

rm -rf $CLIENTDIR

openapi-generator-cli validate -i $APIDIR/spec.yaml
openapi-generator-cli generate -i $APIDIR/spec.yaml \
-g typescript-axios \
-o $APIDIR/build/ts_client \
-c $SCRIPTPATH/conf/tsconf.yml

GITHUB_ORG='gyutaeha'
GITHUB_REPO='openapi_generator_demo'
# $GITHUB_TOKEN 환경변수도 설정 필요, 보안상 스크립트에서 제외

sed -e 's/GIT_USER_ID/'"$GITHUB_ORG"'/g' -e 's/GIT_REPO_ID/'"$GITHUB_REPO"'/g' $CLIENTDIR/package.json > $CLIENTDIR/package.json.tmp
mv $CLIENTDIR/package.json.tmp $CLIENTDIR/package.json

cd $CLIENTDIR
npm install
npm set //npm.pkg.github.com/:_authToken $GITHUB_TOKEN
npm login --scope=$GITHUB_ORG --registry=https://npm.pkg.github.com
npm publish --scope=$GITHUB_ORG --registry=https://npm.pkg.github.com