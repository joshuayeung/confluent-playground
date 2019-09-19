git clone https://github.com/confluentinc/examples
cd examples
git checkout 5.3.1-post

cd cp-all-in-one/

# install docker-compose
sudo curl -x 172.19.1.179:3128 -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose



docker-compose up -d --build




helm install \
-f ./providers/private.yaml \
--name operator \
--namespace operator \
--set operator.enabled=true \
./confluent-operator


helm install \
-f ./providers/private.yaml \
--name zookeeper \
--namespace operator \
--set zookeeper.enabled=true \
./confluent-operator
