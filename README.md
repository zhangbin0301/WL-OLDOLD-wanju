# 玩具鸡通用脚本


第一：包含三种平台脚本，脚本功能一样，都是调用start.sh脚本启动xray

第二：仓库中提供一个我的脚本start.sh，仅供参考，脚本自适应amd和arm，你需要在config.yml里面设置参数，端口无所谓，因为这是利用ARGO隧道的配置

第三：各平台需要的文件（一般如果启动文件名称不一样，先把启动文件名称改成与本仓库一至）

1、python:start.sh config.yml main.py requirements.txt

2、nodejs:start.sh config.yml package.json index.js

3、JAVA:start.sh config.yml server.jar

4、能直接启动start.sh的平台：start.sh config.yml

# 下面以wyldhost.d为例简单展示java使用方法，其他类似

1、修改玩具容器的启动文件为server.jar

![image](https://github.com/dsadsadsss/dis-wanju/blob/main/png/1.PNG)

2、上传文件本仓库中的server.jar和config.yml,修改config.yml中的变量

![image](https://github.com/dsadsadsss/dis-wanju/blob/main/png/2.PNG)


3、修改server.jar和start.sh权限为777，然后运行

![image](https://github.com/dsadsadsss/dis-wanju/blob/main/png/3.PNG)

