###	VARIABLES ###

DATA_PATH	=	/home/hedubois/data

WP_PATH		=	$(DATA_PATH)/wordpress
MDB_PATH	=	$(DATA_PATH)/mariadb

DCKR_CMP	=	./srcs/docker-compose.yml

### RULES ###

all:
#	 mkdir -p /home/hedubois/data
	 docker-compose -f $(DCKR_CMP) build --parallel
	 docker-compose -f $(DCKR_CMP) up -d

down:
	 -docker-compose -f $(DCKR_CMP) down

clean:
	 -docker-compose -f $(DCKR_CMP) down
	 -docker system prune -af
	 -docker volume prune -af
	 -docker volume rm srcs_wordpress
	 -docker volume rm srcs_mariadb
	 -sudo rm -rf ~/data

re: clean all
