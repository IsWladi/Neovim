# Configuración de neovim
*Enfocado en usar neovim con un layout Dvorak*


## ¿Cómo implementar?
* instalar chocolatey https://chocolatey.org/install#individual
* instalar neovim con chocolatey en poweshell con permisos de administrador con el comando: choco install neovim
* abrir neovim con el comando nvim para que se genere la carpeta "nvim-data" en C:\Users\nombreusuario\AppData\Local(posiblemente la ubicación puede variar)
* renombrar la carpeta "nvim-data" como "nvim" y abrir neovim(comando nvim) para que se genere nuevamente la carpeta "nvim-data" aparte de la de "nvim"
* borrar lo que hay ahora dentro de la carpeta"nvim" y hacer un archivo llamado "init.vim" con este contenido; "call plug#begin()
Plug 'vim-airline/vim-airline'
   ![image](https://user-images.githubusercontent.com/83993271/221377993-994ea21a-2240-42c8-abec-f7c6ca4384ed.png)

call plug#end()"
* instalar vim plug(instalación mediante comando de powershell indicado en documentación) 
  ![image](https://user-images.githubusercontent.com/83993271/221377593-12ef608d-5d4c-4595-bfea-62bb204e434e.png)

  *quedara em la ubicación "C:\Users\nombreusuario\AppData\Local\nvim-data\site\autoload"(al menos en windows)*
* abrir nvim y poner :PlugInstall para que se instale el plug "vim-airline" y así probar que todo haya salido correctamente
* borrar lo que hay ahora dentro de la carpeta"nvim" y hacer un "git clone https://github.com/Wladimir3984/Neovim-Dvorak ." dentro de la carpeta "nvim"
  
### Referencias agrupadas
* puedes ver los pasos de instalación de chocolatey en https://chocolatey.org/install#individual
* Puedes encontrar el repositorio oficial de vim plug en https://github.com/junegunn/vim-plug

### Para implementar al repo a futuro
* **implementar mi neovim local a una instalación estandarizada en la documentación de este repo**

* **implementar autopep8 a neovim para formatear codigo python de manera automatica**
  * https://pypi.org/project/autopep8/ 
  * https://github.com/python-mode/python-mode 
  * https://stackoverflow.com/questions/15285032/autopep8-with-vim*
