# Configuración de neovim
*Enfocado en usar neovim con un layout Dvorak*


## ¿Cómo implementar?
* instalar chocolatey https://chocolatey.org/install#individual
* instalar neovim con chocolatey en poweshell con permisos de administrador con el comando: choco install neovim
* comprobar con comando "nvim" 
* donde se instalo neovim, renombrar la carpeta "nvim-data" como "nvim" y abrir neovim
* borrar lo que hay ahora dentro de la carpeta"nvim" y crear archivo "init.vim" dentro de la misma
* instalar vim plug(instalación mediante comando de powershell indicado en documentación oficial de vim-plug) https://github.com/junegunn/vim-plug
* en init.vim poner esto:

  ![image](https://user-images.githubusercontent.com/83993271/220817042-b2d737c9-af28-4980-bad8-f9a555016b03.png)

* abrir nvim y poner :PlugInstall para que se instale el plug "vim-airline" y así probar que todo haya salido correctamente
  
### Referencias agrupadas
* puedes ver los pasos de instalación de chocolatey en https://chocolatey.org/install#individual
* Puedes encontrar el repositorio oficial de vim plug en https://github.com/junegunn/vim-plug

### Para implementar al repo a futuro
* **implementar mi neovim local a una instalación estandarizada en la documentación de este repo**

* **implementar autopep8 a neovim para formatear codigo python de manera automatica**
  * https://pypi.org/project/autopep8/ 
  * https://github.com/python-mode/python-mode 
  * https://stackoverflow.com/questions/15285032/autopep8-with-vim*
