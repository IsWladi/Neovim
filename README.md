# Mi configuración de neovim

*Enfocado en usar neovim con un layout Dvorak, configuración personal*

## Estado actual del repositorio

- Funciona la instalación en windows(no me consta en otro OS)
- format on save habilitado para python, JavaScript, css, html y markdown(no funciona con lsp, sino con autopep8 y prettier)
- Funcionalidades de lsp
- autocompletado
- instalacion sencilla
- integración de git
- telescope
- Debug with debbug adapter protocol

## ¿Cómo implementar?

### Instalar neovim (Windows)
- instalar chocolatey https://chocolatey.org/install#individual
- instalar [neovim](https://neovim.io/) con chocolatey en poweshell con permisos de administrador `choco install neovim` 

### Dependencias
  - instalar [python](https://www.python.org/)
  - instalar [autopep 8](https://pypi.org/project/autopep8/) para format on save con python `pip install autopep8`
  - instalar [node.js](https://nodejs.org/en/) para instalar prettier con el gestor de paquetes npm
    - instalar [prettier](https://prettier.io/docs/en/install.html) para format on save con JavaScript, css, html y markdown 
  - instar mingw para treesitter; `choco install mingw` (in admin powershell), despues de instalado ejecutar `refreshenv`(in admin powershell) 
    - [treesitter soporte para Windows](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support)
  - instalar [ripgrep](https://github.com/BurntSushi/ripgrep#installation) y [fzf](https://github.com/junegunn/fzf#windows) para telescope
    - `choco install ripgrep`
    - `choco install fzf`
  - instalar debugpy para debbug:
    - `python -m venv debugpy` en users/usuario/
    - `debugpy\Scripts\activate`en users/usuario/ para activar el entorno virtual de python
    - con el venv activado: `python -m pip install --upgrade debugpy`
    
### Instalar configuración de este repo
- abrir neovim con el comando nvim para que se genere la carpeta "nvim-data" en C:\Users\nombreusuario\AppData\Local(posiblemente la ubicación puede variar)
- renombrar la carpeta "nvim-data" como "nvim" y abrir neovim(comando nvim) para que se genere nuevamente la carpeta "nvim-data" aparte de la de "nvim"
- borrar lo que hay ahora dentro de la carpeta"nvim" y hacer un `git clone https://github.com/Wladimir3984/Nvim .` dentro de la carpeta "nvim"
- abrir neovim y esperar a que se instalen plugins, servers de lsp(se instalan automaticos, hay que esperar, se puede ver con `:MasonLog`) y languages de treesitter
- reiniciar neovim

![image](https://user-images.githubusercontent.com/83993271/227046631-6e233aa1-c803-4487-963d-f21a87d29fd7.png)


### Referencias agrupadas

- puedes ver los pasos de instalación de chocolatey en https://chocolatey.org/install#individual
- documentación oficial de neovim https://neovim.io/
- documentación oficial de python https://www.python.org/
- documentación oficial de autopep8 en https://pypi.org/project/autopep8/
- documentación oficial de node.js https://nodejs.org/en/
- documentación oficial de prettier en https://prettier.io/
- documentación para soporte de treesitter en Windows en https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support


### Para implementar al repo a futuro

- Keymaps que usan las dependencias tengan manejo de excepciones en caso de no estar instaladas 
