# test001
This Is The Fixed Version Of 
4DockerImages001 : 
https://github.com/ox1d0/4DockerImages001

ON 4DockerImages001 is need to complete the uwsgi setup. This one is Production Funtional due were did some changes:

For nginx.conf in order to use nginx only as reversed proxy  were changed :

include uwsgi_params;     
uwsgi_pass 127.0.0.1:9090; 	

intent  were added :

	 proxy_pass http://127.0.0.1:5000;
	 proxy_set_header Host "localhost";

In this way the request asked on 80 port would be routed to 127.0.0.0.1:5000 which is the Flask rest service.

workaround to the uwsgi setup. 

-------------------OLD--Readme--------------

Traget:

CDN Log Aggregator will read CDN traffic logs from a file and generate a report based on the aggregate data coming from the logs,

The Data ingestion it's ALso Automatically Calculated and processing by Pandas.

I'm using pd.read_csv function then I'm retrieving the information on fly, playing whit the matrix information holded by the dataframe that are showed by Flask server.

The loading_theLogs001.py Script is designed to Load and show the reports as job,

However the Chalenge ask for a rest api So Were designed a RestAPI for handler urls via Web page that is gonna run Only on Production because security restrictions, is gonna use nginx and uwSGI.

http://LoadPublicIP

you can see the public IP for GCP load Balancer on the Actions PIPE line

example: service/app-service LoadBalancer 10.1.14.22 34.69.95.97 80:31422/TCP

you could access by

http://34.69.95.97/

the report show the following information On http://LoadPublicIP/:

Subfix

/log1/ ---> show Stadistics For firts logfile /log1/hits --> show min max and count for hits /log1/miss --> show min max and count for miss

/log2/ ---> show Stadistics For second logfile /log2/hits c /log2/miss --> show min max and count for miss

/all/ ---> show Stadistics For Agregate file both logs files /all/hits --> show min max and count for hits on Agregate data frame /all/miss --> show min max and count for miss on Agregate data frame

+ /log1/st
+ /log2/st
+ /all/st

You must provide unit tests/integration tests that ensure your code can do the same task repeatedly with the same results.

to easily deploy and scale your application/job, I use Docker creating automatically a tag and push images to docker registry.

I'm Using A GCP Registry server an I have linked this Repo using Cloud Builder.

Every Commit will trigger an Acction that i gonna use to Build Automatically using the Pipe Script AutoDeployOnGCP001.bash:

It will check for last docker image at Registry will replace the old One with the New one then it will deploy the pods with kubectl create using the manifest file manifest4app.yaml

The unit tests/integration tests are handler by manifest4app.yaml as livenessProbes that is goona check using Get request everry 20 seconds the 80 port that is handler by nginx reversed proxy On Production.
