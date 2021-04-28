# k8s-sonatype-nexus

Contains a configuration to spin up a Sonatype Nexus instance inside a kubernetes cluster.

## Prerequisites

* kind
* kubectl
* Sonatype Nexus

Note: Depending on the OS, it may be necessary to prefix all commands with `sudo`.

## Configuration

1.  Create the `kind` cluster:
    ```shell
    kind create cluster --name=sonatype-nexus --config=kind/config.yaml
    ```
    
2.  Set the cluster config:
    ```shell
    kubectl cluster-info --context kind-sonatype-nexus
    ```

3.  Deploy the Sonatype Nexus instance:
    ```shell
    kubectl apply -k k8s/local/
    ```

## Usage

### Access from localhost

To access the Sonatype Nexus cluster from your machine, port-forwarding can be used.

1.  Start port-forwarding:
    ```shell
    kubectl port-forward service/sonatype-nexus-service 30081:8081 
    ```
    
2.  Open a separate terminal and confirm a connection:
    ```shell
    curl http://localhost:30081/
    ```
    
3.  Open a browser and navigate to `curl http://localhost:30081/` to access the Sonatype Nexus GUI.

4.  Sign in as the `admin` user to make changes.  The password can be found inside `/nexus-data/admin.password` within the pod.
    ```shell
    kubectl exec -it $POD_NAME -- /bin/sh
    ```
    where $POD_NAME is the name of the Sonatype Nexus pod from `kubctl get pods`

## Resources

* https://help.sonatype.com/repomanager3
* https://hub.docker.com/r/sonatype/nexus3
