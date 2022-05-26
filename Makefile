pkg ?= python_skeleton

init-pre-commit:
	git config --global url."https://".insteadOf git://
	pre-commit install
	pre-commit run --all-files

update-pre-commit:
	pre-commit autoupdate

test:
	pytest --cov -s ./tests
	coverage html

rename-pkg:
	sed -i "" "s/python_skeleton/${pkg}/"  pyproject.toml
	sed -i "" "s/python-skeleton/${pkg}/"  pyproject.toml
	sed -i "" "s/python_skeleton/${pkg}/"  tests/test_python_skeleton.py
	mv python_skeleton ${pkg}
	mv tests/test_python_skeleton.py tests/test_${pkg}.py
