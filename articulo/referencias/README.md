# Convertir de bibtex a bibitem

La forma como se están manejando las referencias en este artículo es a través de *bibitem*. 
En este caso las referencias están definidas en el archivo [main.tex](../main.tex). 

Referencias de tipo *bibtex* se pueden encontrar "fácilmente" pero es necesario pasarlas a *bibitem* que es el formato que se usa en este artículo.
Se [ha encontrado un código en python](https://tex.stackexchange.com/questions/124874/converting-to-bibitem-in-latex) que convierte de *bibtex* a *bibitem*. 
El código se encontraba en Python2 y con ayuda de la herramienta [2to3](https://docs.python.org/3/library/2to3.html) fue posible pasar el código de Python2 a Python3, [código](bibtex2item.py). 

Asumamos que tenemos el siguiente código de *bibtex*:

```
@article{rad2017introduction,
  title={An introduction to docker and analysis of its performance},
  author={Rad, Babak Bashari and Bhatti, Harrison John and Ahmadi, Mohammad},
  journal={International Journal of Computer Science and Network Security (IJCSNS)},
  volume={17},
  number={3},
  pages={228},
  year={2017},
  publisher={International Journal of Computer Science and Network Security}
}
```

Y está en el archivo `entrada.bib` para convertir este *bibtex* a *bibitem* se ejecuta lo siguiente:

```
python3 bibtex2item.py < entrada.bib > salida.bib
```

Esto da como salida en el archivo `salida.bib` lo siguiente:

```
\bibitem{rad2017introduction}
Rad, B., Bhatti, H. & Ahmadi, M. An introduction to docker and analysis of its performance.  {\em International Journal Of Computer Science And Network Security (ijcsns)}.  \textbf{17}, 228 (2017)
```

Ese contenido se pega en `main.tex` en la zona de `thebibligrography`.
