# ПППРП 
## 💎 Задание 2
### Шаги для воспроизведения
Формально, шаги для воспроизведения продублированы из 1 задачи, поскольку установка istio воспроизведена в скрипте `start_script.sh`

1. ✨ Запускаем minikube 
    ```bash
    minikube start   
    ```
2. ✨ Запускаем скрипт
    ```bash
    sh start_script.sh
    ```
3. ✨ В другом окне терминала запускаем 
    ```bash
    minikube service app-service
    ```
   Получаем url `<url-name>` для подключения к сервису. Далее, для обращения к эндпоинтам: 
    - /time
    ```bash
    curl http://<url-name>/time  
    ```
   - /statistics
    ```bash
    curl http://<url-name>/statistics  
    ```
4. ✨ Наконец, чтобы посмотреть содержимое data.txt выполним:
   - Получаем название пода  `<data-pod-name>`
   ```bash
   kubectl get pods 
   ```
   - Получаем файл data.txt
   ```bash
   kubectl exec -it <data-pod-name> -- /bin/bash
   ```
   - Просматриваем статистику 
   ```bash
   cat data.txt 
   ```
