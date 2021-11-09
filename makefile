# VARIABLES ----------------------------------------------------------------------------------------
PROJ_NAME = cistools

PY  = python
PIP = pip

ENV_DIR     = .env
ENV_BIN_DIR = $(ENV_DIR)/bin
ENV_PY      = $(ENV_BIN_DIR)/python
ENV_PIP     = $(ENV_BIN_DIR)/pip

INSTALLER = pyinstaller
INSTALLER_ARGS = --onefile -n $(PROJ_NAME) $(PROJ_NAME)/cli.py

# RULES --------------------------------------------------------------------------------------------

# Creates an executable from this application
build: dist/$(PROJ_NAME)

dist/$(PROJ_NAME):
	$(INSTALLER) $(INSTALLER_ARGS)

# Removes unnecessary temporary files from the working tree
.PHONY: clean
clean:
	rm -rf build/ dist/ *.egg-info/ $(PROJ_NAME)/__pycache__/ *.spec

# Sets up the virtual environment for development
.PHONY: setup
setup: $(ENV_DIR) # Prevents this from being run if the virtual environment directory exists

$(ENV_DIR):
	$(PY) -m venv $(ENV_DIR)

# Installs project dependencies into the virtual environment
.PHONY: finsh_setup
finish_setup:
	$(ENV_PIP) install --upgrade pip
	$(ENV_PIP) install -r requirements.txt
