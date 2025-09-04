echo "${DOCKER_PASSWORD}" | docker login --username "${DOCKER_USERNAME}" --password-stdin crpi-kq8q9csnww8h09yh.cn-hangzhou.personal.cr.aliyuncs.com

# 创建network
docker network inspect langu-net >/dev/null 2>&1 || docker network create langu-net
# 拉取镜像
docker pull ${image}
# 暂停并删除旧的镜像
docker stop langu-bk 2>/dev/null
docker rm langu-bk 2>/dev/null
# 运行
docker run -d --name langu-bk --network langu-net -e SPRING_DATASOURCE_URL=jdbc:mysql://mysql-langu:3306/langu -e SPRING_DATASOURCE_USERNAME=root -e SPRING_DATASOURCE_PASSWORD=langu@siri123456 -p 8080:8080 ${image}

echo "[langu-bk] 部署完成！"
