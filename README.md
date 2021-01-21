# AIP97-neo4j-setup

<!-- ABOUT THE PROJECT -->
## Setup
```sh
git clone https://github.com/ucsd-ets/neo4j-aip97.git
```
```sh
chmod +x launch-env-agt.sh
```
```sh
(ask staff) Set K8S_HOME_DIR variable in launch-neo4j-agt.sh
```

<!-- GETTING STARTED -->
## Getting Started
1. Log into vpn.ucsd.edu (required for accesing neo4j)<br/>
2. SSH to dsmlp-login.ucsd.edu
3. Oepn neo4j_dir_created_by_its folder
   ```sh
   cd neo4j_dir_created_by_its
   ```
4. Launch neo4j
   ```sh
   ./launch-neo4j-agt.sh
   ```
5. Wait for the shell output ``` pod is running with IP:XXX ``` <br/>
6. Take first url in shell output (e.g., http://128.54.65.160:16585) and paste into your browser url. Wait for "connect to neo4j" page to load<br/>
7. Change connect url to use the second url from the shell output (e.g., neo4j://128.54.65.160:16586)<br/>
8. username: neo4j; password: (ask staff)<br/>
9. press ```Connect```<br/>

To terminate pod/processes
```sh
exit
```
<!-- USAGE EXAMPLES -->
## Test Connection
### Create sample graph
After connecting with neo4j, you should see ```Connected to Neo4j``` on your screen. To run something, select guide link in middle panel, go to second "page", scroll down to bottom panel, click in the box with "CREATE" text (will copy it to middle panel), click "play" button at top right

### Import CSV from local
```sh
cd {root}/neo4j/import
cp {csv_path} .
```
From sandbox in your browser, execute <br/>
```sh
LOAD CSV FROM 'file:///{csv_filename}' AS row
RETURN count(row)
```


