
EXTRA_ARGS?=

default:
	@echo see Makefile for information


bootstrap:
	pyenv virtualenv 3.7.3 configs
	pip install ansible
	ansible-galaxy install -r requirements.yml --force

bootstrap_clean:
	pyenv uninstall -f configs
	rm -r ~/.ansible

first_as_root:
	ansible-playbook -u root --ask-vault-pass -i hosts -k base-playbook.yml $(EXTRA_ARGS)

update:
	ansible-playbook -i hosts --ask-vault-pass -K base-playbook.yml $(EXTRA_ARGS)

