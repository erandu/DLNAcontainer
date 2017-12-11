# DLNAcontainer
Run minidlna within a small Docker container

## How to use ?

First build the container:

```docker build -t erandu/dlnacontainer```

###  Network integration with Macvlan driver (Recommanded)

Using this mode, you integrate the container to the physical network. The container have a fix IP address and there is no need of port-mapping. This mode required Docker 1.12 at least. 

1st Step :
```
docker network create -d macvlan \
    --subnet=192.168.0.0/24 \
    --gateway=192.168.0.254  \
    -o parent=eth0 macvlan_minidlna
 ```   
 Parameters :
 - subnet : Subnet of the network where you want to use minidlna
 - gateway (optional) : IP address of the gateway of the network
 - -o parent : name of the interface to bind
 - macvlan_minidlna : name of the macvlan network
 
 
 2nd Step :
```    
 docker run -d --name minidlna --net=macvlan_minidlna   \
 --ip 192.168.0.100 -v <MUSIC_DIR>:/var/lib/minidlna/music
-v <VIDEO_DIR>:/var/lib/minidlna/videos
-v <PIC_DIR>:/var/lib/minidlna/pictures
erandu/dlnacontainer
``` 
 Parameters :
 - ip : fixed IP address of the container 
 -<DIR>: repository of your data (which can be music, film or pictures)
 
### Basic usage
This mode is not recommended since you use --net=host


```
docker run -d --name minidlna --net=host -p 8200:8200 -p 1900:1900/udp \
-v <MUSIC_DIR>:/var/lib/minidlna/music
-v <VIDEO_DIR>:/var/lib/minidlna/videos
-v <PIC_DIR>:/var/lib/minidlna/pictures
erandu/dlnacontainer
```
