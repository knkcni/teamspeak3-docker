# docker-teamspeak

A nice and easy way to get a TeamSpeak server up and running using docker. 
For help on getting started with docker see the [official getting started guide](https://docs.docker.com/get-started/).
For more information on TeamSpeak and check out it's [website](https://teamspeak.com/de).


## QUICKSTART

Running this will build/run your docker image 

```
git clone https://github.com/knkcni/teamspeak3-docker.git
cd teamspeak3-docker
docker-compose up
```


### 1ST RUN : Getting Admin Token and Server Query Admin

To receive this information you need only to run:
```
docker logs teamspeak_server
```
Now you should see information like this:

```
------------------------------------------------------------------
                      I M P O R T A N T
------------------------------------------------------------------
               Server Query Admin Account created
         loginname= "serveradmin", password= "YOUR_PASSWORD"
------------------------------------------------------------------

------------------------------------------------------------------
                      I M P O R T A N T
------------------------------------------------------------------
      ServerAdmin privilege key created, please use it to gain
      serveradmin rights for your virtualserver. please
      also check the doc/privilegekey_guide.txt for details.

       token=YOUR_TOKEN
------------------------------------------------------------------

```

**COPY THEM FOR LATER USE!**


### Quickstart

Boot up the server exposing just the main voice port (9987/udp). ServerQuery and 
other features are only accessible via `docker exec`. DB, logs, and other files
are not preserved with this container, but this method is a quick way to spin up
a server quickly.

```
	docker run -d -p=9987:9987/udp -p=10011:10011 -p=30033:30033 knkcni/teamspeak3
```