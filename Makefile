build:
	docker build -t docker.io/knkcni/teamspeak3 . 

run:
	docker run -d -p=9987:9987/udp -p=10011:10011 -p=30033:30033 knkcni/teamspeak3