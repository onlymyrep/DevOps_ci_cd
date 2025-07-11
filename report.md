## Part 1. Настройка gitlab-runner

- поднял виртуальную машину Ubuntu Server 22.04 LTS и сразу склонировал

![1.0](misc/images/part1.0.png)
![1.1](misc/images/part1.1.png)

- скачал и установил gitlab-runner

![1.2](misc/images/part1.2.png)
![1.3](misc/images/part1.3.png)

- проверил, что gitlab-runner запущен

![1.4](misc/images/part1.4.png)

- зарегистрировал gitlab-runner

![1.5](misc/images/part1.5.png)

## Part 2. Сборка

- этап сборки приложения из папки code-samples, артефакты хранятся 30 дней

![2](misc/images/part2.png)

- убедился, что стадия сборка завершилась успешно

![2.1](misc/images/part2.1.png)

## Part 3. Тест кодстайла

- написал стадию проверки стиля в файле yml

![3.1](misc/images/part3.1.png)

- успешное выполнение стадии в цепочке пайплайна

![3.2](misc/images/part3.2.png)

## Part 4. Интеграционные тесты

- успешное выполнение стадии в цепочке пайплайна

![4](misc/images/part4.png)

## Part 5. Этап деплоя

- успешное выполнение стадии в цепочке пайплайна

![5](misc/images/part5.png)

## Part 6. Уведомления

- после подключения Telegram бота запустил стадию notify

![6.1](misc/images/part6.1.png)

- пришло уведомление в боте

![6.2](misc/images/part6.2.png)