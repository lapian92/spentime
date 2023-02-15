# spentime
Scripts para saber en qué se te va el tiempo

### 1) spentime.sh
Al correr este script nos pregunta cada 15 min qué estamos haciendo.

Por cada respuesta va generando un archivo (DD-MM-AA.txt en la carpeta "resumes"), por ejemplo:
```
15,Desayunando,8:00
15,Leyendo mails,8:15
15,Revisando PRs,8:30
15,Revisando PRs,8:45
```

NOTAS: 
- Cuando esta por llegar el momento de responder hace 3 pitidos y después salta el popup del prompt, y cuando respondemos nos vuelve a llevar a la ventana donde estábamos parados.
- Si seguimos en la misma tarea, apretando Enter vuelve a repetir la respuesta anterior


### 2) resumes/tiempos.sh
Este script recibe como parámetro el archivo que genera spentime.sh
Y al procesarlo imprime un output del estilo:
```
Tarea: Desayunando. Tiempo total: 15 minutos
Tarea: Leyendo mails. Tiempo total: 15 minutos
Tarea: Revisando PRs. Tiempo total: 30 minutos
```
