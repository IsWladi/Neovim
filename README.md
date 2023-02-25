# Configuración de neovim
*Enfocado en usar neovim con un layout Dvorak*


## ¿Cómo implementar?
* instalar chocolatey https://chocolatey.org/install#individual
* instalar neovim con chocolatey en poweshell con permisos de administrador con el comando: choco install neovim
* abrir neovim con el comando nvim para que se genere la carpeta "nvim-data" en C:\Users\nombreusuario\AppData\Local(posiblemente la ubicación puede variar)
* renombrar la carpeta "nvim-data" como "nvim" y abrir neovim(comando nvim) para que se genere nuevamente la carpeta "nvim-data" aparte de la de "nvim"
* borrar lo que hay ahora dentro de la carpeta"nvim" y hacer un "git clone https://github.com/Wladimir3984/Neovim-Dvorak ." dentro de la carpeta "nvim"
*instalar vim plug para neovim 
  * quedara em la ubicación "C:\Users\nombreusuario\AppData\Local\nvim-data\site\autoload"(al menos en windows)*
* abrir nvim(saldran algunos errores, es normal, apretar enter y continuar) y poner :PlugInstall para que se instalen todos los pluggins
* cerrar y abrir neovim, se vera algo así: 

![image](https://user-images.githubusercontent.com/83993271/221379180-e1292d25-9723-4452-98a7-466e32083409.png)

* NO FUNCIONA copiar archivo extra/presets.lua de este repositorio y reemplazarlo por el  archivo del mismo nombre en esta ubicación "nvim-data\plugged\tabby.nvim\lua\tabby\presets.lua"

### Referencias agrupadas
* puedes ver los pasos de instalación de chocolatey en https://chocolatey.org/install#individual
* Puedes encontrar el repositorio oficial de vim plug en https://github.com/junegunn/vim-plug

### Para implementar al repo a futuro

* **implementar autopep8 a neovim para formatear codigo python de manera automatica**
  * https://pypi.org/project/autopep8/ 
  * https://github.com/python-mode/python-mode 
  * https://stackoverflow.com/questions/15285032/autopep8-with-vim*
