import subprocess
import threading
import socket
import time

def start_script(script_path):
    # 构造执行命令
    cmd = f"nohup chmod +x {script_path} && ./{script_path} &"
    
    try:
        # 执行命令
        subprocess.Popen(cmd, shell=True)
        print("脚本已在后台启动")
        
    except Exception as e:
        print("启动脚本时出错：", str(e))

def start_listening(port):
    # 创建套接字
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    try:
        # 绑定到指定的端口
        server_socket.bind(('0.0.0.0', port))
        
        # 开始监听连接
        server_socket.listen(1)
        print("正在监听端口", port)
        
        while True:
            # 等待客户端连接
            client_socket, address = server_socket.accept()
            print("接收到来自", address, "的连接")
            
            # 发送数据给客户端
            response = b"hello world"
            client_socket.sendall(response)
            
            # 关闭与客户端的连接
            client_socket.close()
            
    except Exception as e:
        print("发生错误：", str(e))
        
    finally:
        # 关闭服务器套接字
        server_socket.close()

# 启动脚本并将其作为后台进程运行
start_script('./start.sh')

# 启动监听
listening_thread = threading.Thread(target=start_listening, args=(10027,))
listening_thread.start()

# 监控脚本进程
script_path = './start.sh'
monitoring_cmd = f"pgrep -f {script_path}"
while True:
    process = subprocess.Popen(monitoring_cmd, shell=True, stdout=subprocess.PIPE)
    output = process.stdout.read()
    if output:
        print("脚本进程运行中")
    else:
        print("脚本进程未找到，重新启动脚本")
        start_script(script_path)
    time.sleep(10)
