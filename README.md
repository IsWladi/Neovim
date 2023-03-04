# Configuración de neovim
*Enfocado en usar neovim con un layout Dvorak*

## Estado actual del repositorio
* Funciona la instalación en windows(no me consta en otros OS)
* Esta en proceso de prueba, no se asegura compatibilidad de instalación en cualquier pc
* Instalación engorrosa, proximamente se habilitara un scripts de powershell para facilitar imprementación de esta configuración de nvim
* autopep8 mapeado en <leader> e (falta implementarlo al guardar solo cuando es extension .py)
## ¿Cómo implementar?
* instalar chocolatey https://chocolatey.org/install#individual
* instalar neovim con chocolatey en poweshell con permisos de administrador con el comando: choco install neovim
* abrir neovim con el comando nvim para que se genere la carpeta "nvim-data" en C:\Users\nombreusuario\AppData\Local(posiblemente la ubicación puede variar)
* renombrar la carpeta "nvim-data" como "nvim" y abrir neovim(comando nvim) para que se genere nuevamente la carpeta "nvim-data" aparte de la de "nvim"
* borrar lo que hay ahora dentro de la carpeta"nvim" y hacer un "git clone https://github.com/Wladimir3984/Neovim-Dvorak ." dentro de la carpeta "nvim"
* instalar vim plug para neovim 
  * quedara en la ubicación "C:\Users\nombreusuario\AppData\Local\nvim-data\site\autoload"(al menos en windows) 
* abrir nvim(saldran algunos errores, es normal, apretar enter y continuar) y poner :PlugInstall para que se instalen todos los pluggins
* cerrar y abrir neovim, se vera algo así(la forma en que se ve puede variar segun la actualización del repositorio): 
* **SOLO SI USAS PYTHON**, instalar autopep8 en consola de comandos con "pip install autopep8" para habilitar el mapeo para formatear <leader> e 

![image](https://user-images.githubusercontent.com/83993271/221379180-e1292d25-9723-4452-98a7-466e32083409.png)

### Referencias agrupadas
* puedes ver los pasos de instalación de chocolatey en https://chocolatey.org/install#individual
* Puedes encontrar el repositorio oficial de vim plug en https://github.com/junegunn/vim-plug
* documentación oficial de autopep8 en https://pypi.org/project/autopep8/

### Para implementar al repo a futuro

* **implementar autopep8 a neovim para formatear codigo python de manera automatica**
  * https://pypi.org/project/autopep8/ 
  * https://github.com/python-mode/python-mode 
  * https://stackoverflow.com/questions/15285032/autopep8-with-vim*
