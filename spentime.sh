################################################################
###                          SPENTIME                       ####
###          util para saber en qué gastas el tiempo        ####
###   los inputs se escriben en un archivo DD-MM-AAA.txt    ####
###                                                         ####
###  cambiar esto para configurar el intervalo              ####
PREGUNTAR_CADA=15  # minutos
################################################################

clear

echo "Hola! Cada $PREGUNTAR_CADA minutos te voy a preguntar qué estas haciendo."
echo "Qué tengas un buen día!"
echo "para salir: ctrl+C"
echo ""

INTERVAL=$((60*$PREGUNTAR_CADA))
tarea1="Planificando el día"

# me guardo la ventana donde se corre el script para levantarla en cada fin de intervalo
thiswindow=$(xdotool getactivewindow)

# inicializo la variable donde vamos a guardar el id de la ventana donde estamos antes de levantar el prompt
current=""
while :
do
        # hago la pregunta
        read -p "¿Con qué estás? (pulsa Enter para '$tarea1'): " tarea2
        clear
        echo "te vuelvo a preguntar a las $(date -d "$(date +%R) $INTERVAL seconds" +'%H:%M')"

        # si habia una ventana activa antes de este script, le hago foco
        if [ "$current" != "" ]; then
              xdotool windowactivate $current
        fi

        # si no respondio nada, dejo la respuesta anterior
        if [ "$tarea2" = "" ]; then
              tarea2="$tarea1"
        else
              tarea1="$tarea2"
        fi

        # guardo la respuesta en minutos
        echo "$PREGUNTAR_CADA,$tarea2,$(date +%R)" >> "resumes/$(date +%d-%m-%y).txt"

        # espero el intervalo menos 3 segundos para los pitidos
        sleep $(($INTERVAL - 3))

        # hago subir y bajar el brillo para que aparezca el cartel y sepas que te esta por preguntar
        xdotool key XF86AudioRaiseVolume;
        xdotool key XF86AudioLowerVolume;
        sleep 3;
        clear

        # almaceno la ventana activa antes de levantar el prompt
        current=$(xdotool getactivewindow)

        # levanto el prompt
        xdotool windowactivate $thiswindow
done
