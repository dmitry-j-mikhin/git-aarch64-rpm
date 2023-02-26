set -ex

docker run -it --rm \
 -v $(pwd):/srv -v $(pwd):/home/builder \
 dmikhin/rpmbuild:aarch64 bash -c \
 'cd ~/
  mkdir -p rpmbuild/SRPMS
  wget -P rpmbuild/SRPMS https://packages.endpointdev.com/rhel/7/os/SRPMS/git-2.39.2-1.ep7.1.src.rpm
  sudo yum-builddep -y rpmbuild/SRPMS/git-2.39.2-1.ep7.1.src.rpm
  rpmbuild --rebuild rpmbuild/SRPMS/git-2.39.2-1.ep7.1.src.rpm'

echo "resulting files:"
ls -al rpmbuild/RPMS/*