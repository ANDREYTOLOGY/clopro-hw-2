# Домашнее задание к занятию "`Безопасность в облачных провайдерах`" - `Чернышов Андрей`

### Задание 1

Выполнено применение Terraform-конфигурации. Созданы ресурсы инфраструктуры, включая симметричный ключ KMS.    
![terraform 1](https://github.com/ANDREYTOLOGY/terraform-hw/blob/main/img/clopro2-1.png)  

Создан симметричный ключ `bucket-key` в сервисе `Yandex Key Management Service (KMS)`. Данный ключ используется для шифрования объектов, размещаемых в `Object Storage`.  
![terraform 1](https://github.com/ANDREYTOLOGY/terraform-hw/blob/main/img/clopro3-2.png)  

Для бакета Object Storage включено серверное шифрование. В качестве ключа шифрования выбран ранее созданный симметричный ключ bucket-key. Новые объекты, загружаемые в бакет, автоматически шифруются средствами Yandex KMS.  
![terraform 1](https://github.com/ANDREYTOLOGY/terraform-hw/blob/main/img/clopro3-3.png)  

