# Mi configuración de neovim

*Enfocado en usar neovim con un layout Dvorak, configuración personal*

## Estado actual del repositorio

- Funciona la instalación en windows(no me consta en otro OS)
- format on save habilitado para python, JavaScript, css, html y markdown(no funciona con lsp, sino con autopep8 y prettier)
- Funcionalidades de lsp
- autocompletado
- instalacion sencilla y con automatización
- integración de git
- telescope
- Debug with debbug adapter protocol

# ¿Cómo implementar?

## Instalar neovim (Windows)
- instalar chocolatey https://chocolatey.org/install#individual
- instalar [neovim](https://neovim.io/) con chocolatey en poweshell con permisos de administrador `choco install neovim` 
    
## Instalar configuración de este repo
- abrir neovim con el comando nvim para que se genere la carpeta "nvim-data" en C:\Users\nombreusuario\AppData\Local(posiblemente la ubicación puede variar)
- renombrar la carpeta "nvim-data" como "nvim" y abrir neovim(comando nvim) para que se genere nuevamente la carpeta "nvim-data" aparte de la de "nvim"
- borrar lo que hay ahora dentro de la carpeta"nvim" y hacer un `git clone https://github.com/Wladimir3984/Nvim .` dentro de la carpeta "nvim"
- abrir neovim y esperar a que se instalen plugins, servers de lsp(se instalan automaticos, hay que esperar, se puede ver con `:MasonLog`) y languages de treesitter
- reiniciar neovim

### Dependencias externas de mi configuración
- instalar [python](https://www.python.org/)
- instalar [node.js](https://nodejs.org/en/)
- instalar debugpy para debbug:
  - `python -m venv debugpy` en users/usuario/
  - `debugpy\Scripts\activate`en users/usuario/ para activar el entorno virtual de python
  - con el venv activado: `python -m pip install --upgrade debugpy`
- `<leader><leader>ch` para instalar dependencias secundarias

![image](https://user-images.githubusercontent.com/83993271/227046631-6e233aa1-c803-4487-963d-f21a87d29fd7.png)


## Referencias agrupadas

- puedes ver los pasos de instalación de chocolatey en https://chocolatey.org/install#individual
- documentación oficial de neovim https://neovim.io/
- documentación oficial de python https://www.python.org/
- documentación oficial de autopep8 en https://pypi.org/project/autopep8/
- documentación oficial de node.js https://nodejs.org/en/
- documentación oficial de prettier en https://prettier.io/
- documentación para soporte de treesitter en Windows en https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support


## Para implementar al repo a futuro

- 100% automatización al instalar mi configuración
