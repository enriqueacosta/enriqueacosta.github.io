Esta carpeta contiene las imágenes que se crearon en Tikz (LaTeX). El código fuente de cada imagen está en los archivos `.tex`. 

Por ejemplo, el contenido de `tikz-file-149311.tex` es:
```Tex
\documentclass[grado3]{LEMA-Tikz-IM}
\begin{document}
\begin{tikzpicture}


\newcommand{\hSep}{3.3*\midDotSize}
\newcommand{\vSep}{2*\midDotSize}
\midDotGroup{2}{1}
\midDotGroup[shift={(1*\hSep,0)}]{2}{1}
\midDotGroup[shift={(2*\hSep,0)}]{2}{1}
\midDotGroup[shift={(0,1*\vSep)}]{2}{1}
\midDotGroup[shift={(1*\hSep,1*\vSep)}]{2}{1}
\midDotGroup[shift={(2*\hSep,1*\vSep)}]{2}{1}

\end{tikzpicture}
\end{document}
```
Esté código produce la imagen:


![](tikz-file-149311.svg)


Se creó un estilo propio de Tikz para este proyecto.

*  LEMA-Tikz-IM.cls

En este archivo se define el documentclass `LEMA-Tikz-IM` y todos los comandos especiales, como el `\midDotGroup{#}{#}` que hace un grupo de puntos con un rectángulo alrededor de ellos.


Con el código `.tex`, al correr `pdflatex` se produce el archivo pdf de la imagen que se va a usar en el pdf. Así:
```bash
pdflatex tikz-file-149311.tex
```
Este comando produce el archivo
*  tikz-file-149311.pdf

El archivo `LEMA-Tikz-IM.cls` se ubicó en la carpeta `/assets/` y se incluyeron symlink en las carpetas que lo necesitan (por ejemplo esta `/assets/tikz-source/`) para que LaTeX lo pueda ubicar. Esos symlink funcionan en MacOS y deberían funcionar en Linux también (pero no han sido probados).

## Cambios de tamaño de fuente (y otros elementos) de acuerdo al grado
Se debe especificar el grado para el que se produce la imagen en el `\documentclass`, así
```Tex
\documentclass[grado3]{LEMA-Tikz-IM}
\begin{document}
\begin{tikzpicture}
...
\end{document}
```
Esto afecta el tamaño de la fuente que usa Tikz para las imágenes, para esta coincida con el texto circundante a la imagen. Además de esto, la opción de grado también afecta el tamaño de algunos objetos. Por ejemplo, \midDotSize depende del tamaño de la fuente, por lo que los tamaños de los dados (y sus puntos) varian según el tamaño de la fuente. Esto permite mantener el mismo grosor de línea en las imagenes Tikz para distintos grados, mientras que solo los textos o elementos configurados para cambiar de tamaño lo harán.

Es importante, al crear las imágenes, tener esto en cuenta y usar unidades de medida que dependan del tamaño de la fuente. Esto permite que el mismo código Tikz funcione con distintos tamaños de fuente. Las unidades de medida relativas al tamaño de la fuente son:
* `ex`: el tamaño de una `x`
* `em`: el tamaño de una `m`

Las unidades de medida absolutas, en cambio, no cambian con el tamaño de la fuente. Ejemplos:
*  `pt`
*  `cm`
*  `in`

Por ejemplo, para las tablas, el grosor de la línea debe ser absoluto (ejemplo, `2pt`), mientras que el ancho de las columnas debe relativo (ejemplo `14ex`) para que crezcan proporcionalmente al tamaño de la fuente. Ver por ejemplo `3-4-21-act1-tab.tex`.

### Mismas imágenes para distintos grados
Se pueden crear dos archivos de distinto tamaño(por ejemplo, una para grado 3 con fuente grande y otra para grado 5 con fuente pequeña) usando el mismo código así:
*  Archivo para grado3: `3-4-21-act1-tab.tex` <--- archivo original de grado 3, con opción `\documentclass[grado3]{LEMA-Tikz-IM}`
*  Archivo para grado5: `3-4-21-act1-tab-gra5.tex`, con el siguiente contenido:
```tex
\documentclass[grado5]{LEMA-Tikz-IM}
\usepackage{standalone}
\begin{document}
\input{3-4-21-act1-tab.tex} % versión del estudiante
\end{document}
```
Al compilar `3-4-21-act1-tab-gra5.tex` con `pdflatex`, el paquete `standalone` ignora la opción de grado en el archivo original y aplica la especificada en este nuevo archivo.

Esto puede ser útil también  para crear imágenes más pequeñas para la guía del profesor, que se ajusten al tamaño del texto circundante.
Archivo para el profesor: `3-4-21-act1-tab-profe.tex`, con el siguiente contenido:
```tex
\documentclass[profesor]{LEMA-Tikz-IM}
\usepackage{standalone}
\begin{document}
\input{3-4-21-act1-tab.tex} % versión del estudiante
\end{document}
```

## Generar los archivos svg para la web
La clase LEMA-Tikz-IM se configuró de forma que si se corre `pdflatex` con la opcion de `shell-escape`, se producen automáticamente versiones `.png` y `.svg` para uso en la web aparte de el archivo `.pdf`.

Por ejemplo
```bash
pdflatex -shell-escape tikz-file-149311.tex
```
produce los archivos:
*  tikz-file-149311.pdf
*  tikz-file-149311.svg
*  tikz-file-149311.png

Para que esto funcione se necesita tener instalados en el sistema `pdf2svg`, `rsvg-convert` e `imageMagick`. Para instalar estos en MacOS usar `homebrew`:
* `brew install pdf2svg`
* `brew install librsvg` (para `rsvg-convert`)
* `brew install imagemagick`

También se creó un script para automatizar esta conversión para todos los pdf en la carpeta que no tengan `.svg` correspondiente. Ver el script [convertAllPDFtoSVGinFolder](https://github.com/enriqueacosta/IllustrativeMath-GrupoLEMA/blob/main/scripts/convertAllPDFtoSVGinFolder)

Este script usa `pdf2svg` para hacer la conversión de todos los archivos `pdf` que no tienen correspondiente `svg` en la carpeta. Para esto, ejecuta comandos de la forma:
```bash
pdf2svg tikz-file-147472.pdf
rsvg-convert --zoom 1.25 --format svg --output tikz-file-149311.svg tikz-file-149311.svg
```
La segunda línea agranda los svg que produce pdf2svg, pues estos se ven muy pequeños en la web cuando se ponen en su tamaño natural (al cambiar `width : 100%` a `max-width : 100%` en el CSS. 

Para correr el script hay que ejecutarlo en la forma 
```bash
./convertAllPDFtoSVGinFolder
```
Es posible que toque hacer una copia del script en la carpeta `assets/tikz-source` para poder ejecutarlo.
