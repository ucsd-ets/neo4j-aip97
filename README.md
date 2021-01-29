# AIP97-neo4j-setup

<!-- ABOUT THE PROJECT -->

<!-- GETTING STARTED -->
## Getting Started
1. Log into vpn.ucsd.edu (required for accesing neo4j sandbox)<br/>
2. SSH to dsmlp-login.ucsd.edu
3. Find `launch-neo4j.sh` script
   ```sh
   which launch-neo4j.sh
   ```
4. Launch the `launch-neo4j.sh` script return from step 3
   ```sh
   /software/common64/dsmlp/bin/launch-neo4j.sh
   ```
5. Wait for the shell output ``` pod is running with IP:XXX ``` <br/>
6. Take first url in shell output (e.g., http://128.54.65.160:16585) and paste into your browser url. Wait for "connect to neo4j" page to load<br/>
7. Change connect url to use the second url from the shell output (e.g., neo4j://128.54.65.160:16586)<br/>
8. username: neo4j; password: (ask staff)<br/>
9. press ```Connect```<br/>
10. Additional users can access the login url by pasting that first url in shell output into their browser

To terminate pod/processes
```sh
exit
```

<!-- NOTES ON SHARING DB -->
## Sharing Database between Users
Each user on dsmlp-login has permission to launch their own neo4j database by following the steps aboving (executing `launch-neo4j.sh`).
If multiple users want to work on a shared database, one user in the group can launch neo4j and provide both urls from that luanch to other users in the group in order for them to access the same database.

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



