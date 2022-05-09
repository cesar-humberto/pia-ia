# PIA Inteligencia Artificial

Universidad Autónoma de Nuevo León \
Facultad de Ciencias Físico Matemáticas

Cesar Humberto Gavilan Hernandez - 1990142

Entrega de proyecto integrador, en este proyecto se aplican los conceptos vistos en clase para la creación de un planificador de un tema libre.

## Tema elegido



## Uso

```bash
 # se tiene que tener instalado docker y crear la imagen del blackbox
 docker build -t blackboximage .

 # después ejecuta el siguiente comentado
 docker run -v C:/Users/cesar/Desktop/IA/src:/problems:Z --name myBlackBox --rm blackboximage sh -c "/blackbox -maxauto 100 -o /problems/domain.pddl -f /problems/probBlocks.pddl -solver -maxsec 0 graphplan | tee /problems/outputs/FT$(date -u +"%H%M%S").log"

 # importante tener los archivos de domain que tiene la configuración y probBlocks el proceso
 
 # la salida de los datos se almacena en la carpeta de /src/outputs
    # los archivos tienen el formato de FT <hora, minutos, segundos> .log para que el registro sea único
```


## License
[MIT](https://choosealicense.com/licenses/mit/)


