# 玩具鸡通用脚本


第一：包含三种平台脚本，脚本功能一样，都是调用start.sh脚本启动xray

第二： 仓库中提供的start.sh，仅供参考，脚本自适应amd和arm，你需要在c.yml里面设置参数

       这个脚本有部分alpine平台会出错，建议换成自己的脚本，脚本名称改为start.sh即可

       比如F大的脚本https://github.com/fscarmen2/X-for-Stozu.git
       
       https://github.com/fscarmen2/X-for-Botshard-ARM.git



第三：各平台需要的文件（一般如果启动文件名称不一样，先把启动文件名称改成与本仓库一至）

1、python-----：start.sh config.yml main.py requirements.txt ，四个文件

2、nodejs----------：start.sh config.yml package.json index.js ，四个文件

3、JAVA---------：start.sh config.yml server.jar ，三个文件

4、能直接启动start.sh的平台--------：start.sh config.yml ，二个文件

5、新增30行nodejs版本，不过能用别的方案，不建议使用这个（已测试平台HelioHost serv00 always 报脸等）

第四：隧道设置----：根据你的xray文件，如果你使用的默认的，则8001端口对应vmess,  8002对应vless，详细看仓库的xray-config


# 下面以wyldhost.de为例简单展示java使用方法，其他类似

1、修改玩具容器的启动文件为server.jar

![image](https://github.com/dsadsadsss/dis-wanju/blob/main/png/1.PNG)

2、上传文件本仓库中的start.sh config.yml server.jar三个文件,修改config.yml中的变量

![image](https://github.com/dsadsadsss/dis-wanju/blob/main/png/3.PNG)


3、修改server.jar和start.sh权限为777，然后启动容器

![image](https://github.com/dsadsadsss/dis-wanju/blob/main/png/2.PNG)

