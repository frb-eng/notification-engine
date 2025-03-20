SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

docker build -t hello_server $SCRIPT_DIR

helm upgrade \
  --install \
  --create-namespace \
  --force \
  --namespace demo \
  --set image=hello_server:latest \
  --set imagePullPolicy=Never \
  --wait \
  --timeout 40s \
  hello-server \
  $SCRIPT_DIR/../helm_charts/node_app