set -ex

docker build --pull \
 --tag dmikhin/rpmbuild:aarch64 .
docker push dmikhin/rpmbuild:aarch64