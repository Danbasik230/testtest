Проверял на Ubuntu 22.04 - local host с которого запускал ansible, ошибки связанные с недоступностью некоторых библиотек решил с помощью установки ansible последней версии через ppa репо

sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible

Поднимаем контейнер 
docker-compose up -d

Запускаем плейбук
ansible-playbook -i inventory -u root playbook.yml


Сделал второй плейбук для отдельной роли ssh, перепишу как время будет 
ansible-playbook -i inventory -u user1 playbook_ssh.yml


Требуется повторный перезапуск контейнера после ansible-playbook -i inventory -u root playbook.yml, я не знаю с чем это связано - не было времени разобраться глубже. Что-то написал не так. 

В конце

docker-compose up -d 

http://18.156.136.12:8080/ - вот тут поднято уже, можно посмотреть
