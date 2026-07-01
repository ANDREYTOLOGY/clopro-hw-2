# Домашнее задание к занятию "`Вычислительные мощности. Балансировщики нагрузки`" - `Чернышов Андрей`

### Задание 1

Создан бакет Object Storage. В бакет загружено изображение logo.png, которому предоставлен публичный доступ. Изображение успешно открывается по прямой ссылке из браузера.  
![terraform 1](https://github.com/ANDREYTOLOGY/terraform-hw/blob/main/img/clopro2-1.png)  

Создан сетевой балансировщик нагрузки lamp-network-balancer. Балансировщик получил внешний IP-адрес и находится в состоянии Active, принимая входящий HTTP-трафик.  
![terraform 1](https://github.com/ANDREYTOLOGY/terraform-hw/blob/main/img/clopro2-2.png)  

Выполнено обращение к внешнему IP-адресу балансировщика. Отображается стартовая страница, сформированная с помощью cloud-init, содержащая изображение, загруженное из Object Storage.  
![terraform 1](https://github.com/ANDREYTOLOGY/terraform-hw/blob/main/img/clopro2-3.png)  

Отображается список виртуальных машин. Одна из виртуальных машин группы остановлена, остальные продолжают работать. Несмотря на это, веб-приложение остается доступным через балансировщик нагрузки.  
![terraform 1](https://github.com/ANDREYTOLOGY/terraform-hw/blob/main/img/clopro2-4.png)  
