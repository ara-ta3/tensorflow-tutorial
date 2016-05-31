.PHONY: requirements.txt

tensorboard: 
	which open && open http://localhost:6006
	tensorflow/bin/tensorboard --logdir=./src/MNIST_DATA

virtualenv=$(shell which virtualenv)

jupyter:tensorflow/bin/jupyter
	$< notebook

tensorflow/bin/jupyter: requirements.txt

requirements.txt: tensorflow/bin/pip
	$< install -r $@
	$< install --upgrade https://storage.googleapis.com/tensorflow/mac/tensorflow-0.8.0-py3-none-any.whl

tensorflow/bin/pip: virtualenv

virtualenv:
	test -d ./tensorflow/bin || $(virtualenv) -p python3 --system-site-packages ./tensorflow

upgrade: tensorflow/bin/pip
	$< install --upgrade pip

clean:
	rm -rf tensorflow
	mkdir tensorflow
