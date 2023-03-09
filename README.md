# Configuración de neovim

_Enfocado en usar neovim con un layout Dvorak_

## Estado actual del repositorio

- Funciona la instalación en windows(no me consta en otros OS)
- Esta en proceso de prueba, no se asegura compatibilidad de instalación en cualquier pc
- format on save habilitado para python, JavaScript, css, html y markdown
- go to definition y hover funcionando con pyright en archivos python

## ¿Cómo implementar?

- instalar chocolatey https://chocolatey.org/install#individual
- instalar neovim con chocolatey en poweshell con permisos de administrador con el comando: choco install neovim
- instalar autopep 8 para format on save con python("pip install autopep8"), referencia; https://pypi.org/project/autopep8/
- instalar prettier para format on save con JavaScript, css, html y markdown https://prettier.io/docs/en/install.html
- abrir neovim con el comando nvim para que se genere la carpeta "nvim-data" en C:\Users\nombreusuario\AppData\Local(posiblemente la ubicación puede variar)
- renombrar la carpeta "nvim-data" como "nvim" y abrir neovim(comando nvim) para que se genere nuevamente la carpeta "nvim-data" aparte de la de "nvim"
- borrar lo que hay ahora dentro de la carpeta"nvim" y hacer un "git clone https://github.com/Wladimir3984/Neovim-Dvorak ." dentro de la carpeta "nvim". no abrir neovim por ahora, ya que podria causar unos errores(aunque igual lo puedes usar para el paso siguiente, pero no es recomendable)
- abrir el archivo init.lua del repositorio clonado con un editor de texto y poner el valor de la variable "makeConfig" a "false"
  ![image](https://user-images.githubusercontent.com/83993271/223286922-e5cfcab2-0ac6-4ab6-b512-6754ff040854.png)
- abrir neovim y esperar a que se instalen todos los plugins mediante lazy, cerrar neovim una vez esten listos.
- cambiar el valor de la variable "makeConfig" a "true"
- abrir neovim y disfrutar :D, se vera algo así(la forma en que se ve puede variar segun la actualización del repositorio):
  ![image](https://user-images.githubusercontent.com/83993271/223286613-ca9dd9ed-7fab-4585-8858-26b7c65f01a3.png)

### Referencias agrupadas

- puedes ver los pasos de instalación de chocolatey en https://chocolatey.org/install#individual
- documentación oficial de autopep8 en https://pypi.org/project/autopep8/
- documentación oficial de prettier en https://prettier.io/

### Para implementar al repo a futuro
