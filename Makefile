virtualenv=$(shell which virtualenv)

ipython:tensorflow/bin/ipython3
	$< notebook


tensorflow/bin/ipython3: requirements.txt

requirements.txt: tensorflow/bin/pip
	$< install -r $@

tensorflow/bin/pip: virtualenv

virtualenv:
	test -d ./tensorflow/bin || $(virtualenv) -p python3 --system-site-packages ./tensorflow

upgrade: tensorflow/bin/pip
	$< install --upgrade pip

clean:
	rm -rf tensorflow
	mkdir tensorflow
