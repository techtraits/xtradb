from centos:6

ADD http://www.convirture.com/repos/definitions/rhel/6.x/convirt.repo /etc/yum.repos.d/convirt.repo 
RUN rpm -Uhv http://repo.percona.com/testing/centos/6/os/noarch/percona-testing-0.0-1.noarch.rpm
RUN rpm -Uhv http://www.percona.com/downloads/percona-release/percona-release-0.0-1.x86_64.rpm
RUN yum update -y && yum install -y Percona-XtraDB-Cluster-server-56 Percona-XtraDB-Cluster-client-56 Percona-XtraDB-Cluster-galera-3

VOLUME /data
EXPOSE 3306 4444 4567 4568

RUN mysql_install_db --datadir=/data --user=mysql

CMD bash