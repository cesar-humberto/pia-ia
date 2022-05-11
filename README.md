# PIA Inteligencia Artificial

Universidad Autónoma de Nuevo León \
Facultad de Ciencias Físico Matemáticas

Cesar Humberto Gavilan Hernandez - 1990142

Entrega de proyecto integrador, en este proyecto se aplican los conceptos vistos en clase para la creación de un planificador de un tema libre.

## Tema elegido (Empresa de mudanza)

El tema que elegí fue el de una empresa de mudanza, lo que requiere hacer es mover cajas del tráiler a la casa, existen diferentes tamaños de cajas que pueden ser llevadas con ambas manos o llevar un solo paquete con las dos manos, a continuación se explica mas detallado.

Paquetes | Tamaño | Cantidad de manos
--- | :---: | :---:
pq_ropa | chico | 1
pq_mesa | chico | 1
pq_tv | grande | 2
pq_mueble | grande | 2

Entonces necesitaremos organizarnos para hacer la menor cantidad de viajes posibles de un lugar a otro, supondremos que es un trailer de mudanza y necesitamos dejar los paquetes en una casa.

El dilema seria como hacer el paso de un lugar a otro, asi que el PDDL se enfoca en 7 acciones:

* ``mover``: moverte entre lugares
* ``levantar-pq-grande``: levantar paquetes grandes, utilizando dos manos izquierda y derecha
* ``levantar-pq-chico-iz``: levantar paquetes chicos, utilizando mano izquierda
* ``levantar-pq-chico-de``: levantar paquetes chicos, utilizando mano derecha
* ``bajar-grande``: bajar paquete grande, ambas manos
* ``bajar-chico-iz``: bajar paquete chico, mano izquierda
* ``bajar-chico-de``: bajar paquete chico, mano derecha

Cada acción buscara encontrar el objetivo de mover de un lugar a otro.

## Uso

```bash
 # se tiene que tener instalado docker y crear la imagen del blackbox
 docker build -t blackboximage .

 # después ejecuta el siguiente comentado
 docker run -v C:/Users/cesar/Desktop/IA/src:/problems:Z --name myBlackBox --rm blackboximage sh -c "/blackbox -maxauto 100 -o /problems/domain.pddl -f /problems/problem.pddl -solver -maxsec 0 graphplan | tee /problems/outputs/FT$(date -u +"%H%M%S").log"

 # importante tener los archivos de domain que tiene la configuración y problem el proceso
 
 # la salida de los datos se almacena en la carpeta de /src/outputs
    # los archivos tienen el formato de FT <hora, minutos, segundos> .log para que el registro sea único
```


## License
[MIT](https://choosealicense.com/licenses/mit/)


