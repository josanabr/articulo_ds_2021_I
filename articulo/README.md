# Directorio `articulo`

Este directorio contiene los archivos en LaTeX y otros insumos que permiten la generación del artículo en formato PDF.

## Requerimientos de compilación

Para llevar a cabo la compilación de los archivos LaTeX en este directorio se requieren los siguientes paquetes de software:

* Docker. Al momento se hace uso de la versión 20.10.5.
* `make`.

Para compilar el artículo se ejecuta el comando:

```
make pdflatex
```

Si todo se ejecuta sin inconvenientes esto deberá generar el archivo `main.pdf`.

**Nota** la compilación hará uso de una imagen de Docker que tiene lo necesario para hacer la compilación del documento. La primera vez que lleve a cabo el proceso de compilación, le tomará un cierto tiempo pues la imagen de LaTeX tiene un tamaño de más de 2 GB. Dicha imagen se puede conseguir en [este enlace](https://github.com/blang/latex-docker). 
