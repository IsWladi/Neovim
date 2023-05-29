# Mi configuración de neovim

*Configuración personal*

## Estado actual del repositorio
- Soporte para usar teclado Dvorak o Qwerty(se configura en un .env, ver pasos de instalación)
- Funciona la instalación en windows(en Ubuntu funciona pero no es apto todavía, hay que configurar algunos detalles)
- Instalacion sencilla y portable
- format on save habilitado para python, JavaScript, css, html y markdown(no funciona con lsp, sino con autopep8 y prettier)

# ¿Cómo implementar?

## Instalar neovim (Windows)
- Recomendado: descargar el .zip para windows del repositorio de nvim para tener la ultima version
- Deprecado:
  - Instalar chocolatey https://chocolatey.org/install#individual
  - Instalar [neovim](https://neovim.io/) con chocolatey en poweshell con permisos de administrador `choco install neovim`

## Instalar configuración de este repo
- abrir neovim con el comando nvim para que se genere la carpeta "nvim-data" en C:\Users\nombreusuario\AppData\Local(posiblemente la ubicación puede variar)
- renombrar la carpeta "nvim-data" como "nvim" y abrir neovim(comando nvim) para que se genere nuevamente la carpeta "nvim-data" aparte de la de "nvim"
- borrar lo que hay ahora dentro de la carpeta"nvim" y hacer un `git clone https://github.com/Wladimir3984/Nvim .` dentro de la carpeta "nvim"
- en el directorio `./lua/` crear un archivo `./lua/.env` y escribir dentro: `KB_LAYOUT=DVORAK` o `KB_LAYOUT=QWERTY` segun sea tu caso
- abrir neovim y esperar a que se instalen plugins, servers de lsp(se instalan automaticos, hay que esperar, se puede ver con `:MasonLog`) y languages de treesitter
- reiniciar neovim
- Para habilitar Markdown Preview abre `markdown_preview.lua` para ver un paso adicional del proceso de instalación.

### Dependencias externas de mi configuración
- instalar [python](https://www.python.org/)
- instalar [node.js](https://nodejs.org/en/)
- `<leader><leader>ch` para instalar dependencias que necesitan algunos plugins(ej: fzf, compilador de C, etc. Estan definidas en `my_xdeps.lua`)

![image](https://github.com/Wladimir3984/Nvim/assets/83993271/0008a0e6-cf03-4e5a-8b32-0df4f5434e53)

## Referencias agrupadas

- puedes ver los pasos de instalación de chocolatey en https://chocolatey.org/install#individual
- documentación oficial de neovim https://neovim.io/
- documentación oficial de python https://www.python.org/
- documentación oficial de autopep8 en https://pypi.org/project/autopep8/
- documentación oficial de node.js https://nodejs.org/en/
- documentación oficial de prettier en https://prettier.io/
- documentación para soporte de treesitter en Windows en https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support


## Para implementar al repo a futuro

- Compatibilidad con Windows y Ubuntu(quiza haga algo similar al .env con el tipo de layout)
