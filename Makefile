fusermount: Dockerfile
	docker build -t static-fusermount .
	docker run --rm static-fusermount cat util/fusermount > fusermount
	chmod ug+x fusermount
	upx fusermount
